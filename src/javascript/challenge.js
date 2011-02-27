(function() {
  var coffee_draw, initChallenge, loaded;
  loaded = false;
  window.addEvent('domready', function() {
    return initChallenge();
  });
  initChallenge = function() {
    var canvas, processing, req;
    canvas = $('processing');
    processing = new Processing(canvas, coffee_draw);
    console.log('Hello');
    req = new Request.JSONP({
      url: 'http://www.whatwepayfor.com/api/getBudgetAccount?income=50000&filing=1&year=2015',
      onRequest: function(url) {
        return console.log(url);
      },
      onComplete: function(response) {
        console.log(response);
        return loaded = true;
      },
      log: true
    });
    return req.send();
  };
  coffee_draw = function(p5) {
    p5.setup = function() {
      p5.size(window.getSize().x, window.getSize().x);
      return p5.background(0);
    };
    return p5.draw = function() {
      if (loaded === false) {
        return console.log('false');
      } else {
        console.log('true');
        return p5.background(p5.frameCount);
      }
    };
  };
}).call(this);
