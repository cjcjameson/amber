$(function(){
  beersController = new Beers.Controller(new Beers.View())
  mapController = new Maps.Controller(new Maps.View())
  
  // $('#beer_results img').hide();
})
 
// var i = 0;
// var int=0;
// $(window).bind("load", function() {
//      var int = setInterval("doThis(i)",500);
// });
 
// function doThis() {
//      var images = $('img').length;
//      if (i >= images) {
//           clearInterval(int);
//     }
//     $('img:hidden').eq(0).fadeIn(500);
//     i++;
//   }
