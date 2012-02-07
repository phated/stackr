slate = require 'slate'
jade = require 'slate-jade'
readCategories = require './categories'

server = slate.create()
server.root "#{__dirname}/public"
server.enable '404', 'buffer', 'mime', 'api', 'static'

categories = readCategories()
#console.log categories

server.engine 'jade', jade, { title: "Stackr", categories: categories }
#server.set 'production'
server.listen 8080

console.log "Server started!"

# wscat -c ws://localhost:8080
server.route '/', (socket) ->
  console.log "Client connected"
  socket.on 'close', -> console.log "Client disconnected"
  socket.on 'message', (message) ->
    socket.send 'ay yo waz gud wurld'

# wscat -c ws://localhost:8080/hello
server.route '/hello', (socket) ->
  socket.on 'message', (message) ->
    socket.send 'hello world!'
