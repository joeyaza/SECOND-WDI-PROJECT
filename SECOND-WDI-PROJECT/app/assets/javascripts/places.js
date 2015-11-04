
$(function(){
  $('#pins').imagesLoaded(function(){
    $('#pins').masonry({
      itemSelector: '.box',
      isFitWidth: true
    })
      
    $('.hover').mouseover(function() {
      $(this).children('.text').css("visibility","visible");
    });

    $('.hover').mouseout(function() {
      $('.text').css("visibility","hidden");
    });
  })
    
}) 
