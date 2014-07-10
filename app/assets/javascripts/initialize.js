$(function(){
  beersController = new BeersController(new View())
  $('#search_results').on('click', '.beer_map_button', showZipForm)
  $('#beer_results').on('click', '.zip_code_button', yelpCall)
  $('.back_button').click(function(){
     $('html,body').animate({ scrollTop: $($(this).attr("href")).offset().top }, 'slow','swing');
     return false;
     })
  $('#beer_results img').hide();
})
 
var i = 0;
var int=0;
$(window).bind("load", function() {
     var int = setInterval("doThis(i)",500);
});
 
function doThis() {
     var images = $('img').length;
     if (i >= images) {
          clearInterval(int);
    }
    $('img:hidden').eq(0).fadeIn(500);
    i++;
  }