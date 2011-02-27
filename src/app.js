(function() {
  var app, getDimension, sys;
  app = require('express').createServer();
  sys = require('sys');
  getDimension = function(req, res, next) {
    return sys.puts(req(res(next)));
  };
  app.get('/', function(req, res) {
    return res.send('Hello World');
  });
  app.get('/budget/:dimension', getDimension, function(req, res, next) {
    res.send(req.dimension);
    return next();
  });
  app.listen(3000);
  sys.puts('listening on 3000.');
}).call(this);
