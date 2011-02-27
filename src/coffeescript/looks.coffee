xmlUri = 'http://127.0.0.1:8000/rr_spring2011lookbook_data.xml'

window.addEvent 'domready', ->
   initLooks()   
   
initLooks = () ->
   
   req = new Request(
      url: xmlUri
      method: 'get'
      onSuccess: (txt, xml) ->
         thumbs = []
         images = Slick.search( xml, "image" )
         console.log( images )
         for image in images
            console.log( image )
            thumbs.push 'images/' + image.getAttribute "thumb"
         console.log( thumbs )
         loadThumbs( thumbs )
   )
   req.send()

thumbEvents = ( thumb ) ->
   if ( Browser.ie6 is true )
      console.log( 'ie6' )
   else
      thumb.addEvents
         mouseenter: ->
            thumb.tween('opacity', '0.5')
         mouseleave: ->
            thumb.tween('opacity', '1.0')
         mouseover: ->
            thumb.setStyles
               cursor: 'pointer'
         
loadThumbs = ( thumbs ) ->
   if !images 
      console.log 'no images' 
   else console.log 'images!'
   images = Asset.images( thumbs, 
      properties: 
         width: '205'
         height: '152'           
      onComplete: () ->
         makeThumbs( images )
   )

makeThumbs = ( thumbs ) ->
   links = $('looks').getElements 'a'
   for image, i in thumbs
      thumbEvents( image )
      links[i].grab image
   reveal()

reveal = () ->
   thumbnails = $('looks').getElements('img')
   showItems( thumbnails, 80 )

showItems = (items, speed ) ->
   for item, i in items
      item.fade('hide')
      showItem.delay( i * speed , item )

showItem = ( ) ->
   this.fade('in')      