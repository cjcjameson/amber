$(document).ready(function(){
	bindEvents()
})

function bindEvents(){
	$('#search_genres').on('submit', getGenres)
}

function getGenres(){
	event.preventDefault()
	var getData = $(this).serializeArray();
	$.ajax({
		url: 'beer_genres/search',
		method: 'GET',
		data: getData,
		dataType: 'json'
	}).success(function(){
		console.log("yay!")
	}).fail(function(){
		console.log("boo!")
	})
}