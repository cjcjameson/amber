$(function(){
  beersController = new Beers.Controller(new Beers.View())
  mapController = new Maps.Controller(new Maps.View())
  locationsController = new Locations.Controller(new Locations.View())
  beerGenresController = new BeerGenres.Controller(new BeerGenres.View())
  // $('.back_button').click(function(){
  //    $('html,body').animate({ scrollTop: $($(this).attr("href")).offset().top }, 'slow','swing');
  //    return false;
  //    })
  // $('#beer_results img').hide();
  stickyNavigation()
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
