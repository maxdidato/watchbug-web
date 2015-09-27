# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
getCookie = (name) ->
  re = new RegExp(name + '=([^;]+)')
  value = re.exec(document.cookie)
  if value != null then unescape(value[1]) else null

dispatcher = new WebSocketRails( window.location.hostname + ":" + window.location.port + "/websocket")
# subscribe to the channel
channel = dispatcher.subscribe('alarm')
# You can also pass an object to the subscription event
# var channel = dispatcher.subscribe({channel: 'channel_name', foo: 'bar'});
# bind to a channel event
channel.bind getCookie('watchbug_id'), (data) ->
  alert data
