#Produced for first Eyebeam / Google Data Visualization Challenge

loaded = false

window.addEvent 'domready', ->
   initChallenge()  
   
initChallenge = () ->
   canvas = $('processing')
   processing = new Processing(canvas, coffee_draw)
   console.log 'Hello'
   
   req = new Request.JSONP(
      url: 'http://www.whatwepayfor.com/api/getBudgetAccount?income=50000&filing=1&year=2015'
      onRequest: (url) ->
         console.log url
      onComplete: ( response ) ->
         console.log( response )
         loaded = true
      log: true
   )
   req.send()

coffee_draw = (p5) ->  
  # processing's "init" method:
  p5.setup = () ->
    p5.size window.getSize().x, window.getSize().x
    p5.background(0)
  # where the fun stuff happens:
  p5.draw = () ->
   if ( loaded == false )
      console.log 'false'
   else
      console.log 'true'
      p5.background(p5.frameCount)
