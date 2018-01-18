# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class DrawChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end

  def watch( data )
    stop_all_streams
    if data['image_id'].match /\A[a-zA-Z0-9]+\Z/
      stream_from "image:#{data['image_id']}"
    end
  end

  def stroke( data )
    if data['image_id'].match /\A[a-zA-Z0-9]+\Z/
      ActionCable.server.broadcast("image:#{data['image_id']}", 
                                   { start: { x: data['start_x'].to_i, y: data['start_y'].to_i }, end: { x: data['end_x'].to_i, y: data['end_y'].to_i } } )
    end
  end

  def clear( data )
    if data['image_id'].match /\A[a-zA-Z0-9]+\Z/
      ActionCable.server.broadcast("image:#{data['image_id'].to_s}", 
                                   {clear_image: true})
    end
  end
end
