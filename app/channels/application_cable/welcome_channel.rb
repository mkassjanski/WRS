# /app/channels/application_cable/line_channel.rb

class LineChannel < ApplicationCable::Channel
  def subscribed
    stream_from ‘line’
  end
end
