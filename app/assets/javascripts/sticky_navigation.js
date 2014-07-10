var stickyNavigation = function(){
  var nav_offset_top = $('nav').offset().top
  var fixNavigationPosition = function(){
    var scroll_top = $(window).scrollTop()
    if (scroll_top > nav_offset_top) {
        $('nav').css({ 'position': 'fixed', 'top':0, 'left':0 })
    } else {
        $('nav').css({ 'position': 'relative' })
    }
  }
  fixNavigationPosition()
  $(window).scroll(function() {
         fixNavigationPosition()
    })
}