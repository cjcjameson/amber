$(document).ready(function(){
	bindEvents();
})

function bindEvents(){
  $('.beer_modal_show').on('click',overlay)
}


function overlay() {
	debugger
	$('#overlay').toggleClass('modal_show')
}