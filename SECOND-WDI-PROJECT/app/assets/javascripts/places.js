
$(function(){
  $('#pins').imagesLoaded(function(){
    $('#pins').masonry({
      itemSelector: '.box',
      isFitWidth: true
    })
      
    $('.hover').mouseover(function() {
      $('.text').css("visibility","visible");
    });

    $('.hover').mouseout(function() {
      $('.text').css("visibility","hidden");
    });
  })
    
}) 
  