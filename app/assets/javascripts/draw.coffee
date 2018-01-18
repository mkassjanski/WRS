# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

mousedown = false

document.addEventListener( 'mousedown', ( evt ) ->
  mousedown = true
)
document.addEventListener( 'mouseup', ( evt ) ->
  mousedown = false
)

starting_stroke = {x: 0, y: 0}

ready = ->
  window.canvas = document.getElementById( "easel" )
  window.ctx = window.canvas.getContext( '2d' )

  window.ctx.beginPath()

  window.draw_line = (start, end) ->
    window.ctx.moveTo( start.x, start.y )
    window.ctx.lineTo( end.x, end.y )
    window.ctx.stroke()
    canvas = document.getElementById( "easel" )
    ctx = canvas.getContext( '2d' )

  window.clear_image = () ->
    window.ctx.clearRect(0,0, window.canvas.width, window.canvas.height)
    window.ctx.closePath()
    window.ctx.beginPath()

  currently_drawing = false

  currMousePos = (canvas, evt) ->
    rect = canvas.getBoundingClientRect()
    return {
      x: Math.round(evt.clientX - rect.left),
      y: Math.round(evt.clientY - rect.top)
    };

  canvas.addEventListener( 'mousemove', ( evt ) ->
    mousePos = currMousePos(canvas, evt)

    if mousedown
      App.draw.stroke( window.image_id, starting_stroke.x, starting_stroke.y, mousePos.x, mousePos.y )

    starting_stroke = { x: mousePos.x, y: mousePos.y }
  )

$(document).ready( ready )
$(document).on('page:load', ready)
