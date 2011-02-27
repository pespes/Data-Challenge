app = require('express').createServer()
sys = require 'sys'

getDimension = ( req, res, next ) ->
   sys.puts req res next

app.get '/', (req, res) ->
    res.send 'Hello World'

app.get '/budget/:dimension', getDimension, (req, res, next) ->
   res.send req.dimension
   next()

app.listen 3000
sys.puts 'listening on 3000.'