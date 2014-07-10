var sticky_navigation_offset_top = $('nav').offset().top
var sticky_navigation = function(){
  var scroll_top = $(window).scrollTop()
  if (scroll_top > sticky_navigation_offset_top) {
      $('nav').css({ 'position': 'fixed', 'top':0, 'left':0 })
  } else {
      $('nav').css({ 'position': 'relative' })
  }
}