App.draw = App.cable.subscriptions.create "DrawChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    window.connected()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.start && data.end
      window.draw_line(data.start, data.end)

    if data.clear_image
      window.clear_image()

  watch: (image_id) ->
    # Lets the server know what image to stream to the client
    @perform 'watch', image_id: image_id

  stroke: (image_id, start_x, start_y, end_x, end_y) ->
    # Sends the server a stroke to be displayed on a particular image
    @perform 'stroke', image_id: image_id, start_x: start_x, start_y: start_y, end_x: end_x, end_y: end_y

  clear: (image_id) ->
    # Clears the canvas of every client connected to the image
    @perform 'clear', image_id: image_id
