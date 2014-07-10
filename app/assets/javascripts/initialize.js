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
  var sticky_navigation_offset_top = $('nav').offset().top
  var sticky_navigation = function(){
    var scroll_top = $(window).scrollTop()
    if (scroll_top > sticky_navigation_offset_top) {
        $('nav').css({ 'position': 'fixed', 'top':0, 'left':0 })
    } else {
        $('nav').css({ 'position': 'relative' })
    }
  }
  sticky_navigation()
  $(window).scroll(function() {
         sticky_navigation()
    })
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
