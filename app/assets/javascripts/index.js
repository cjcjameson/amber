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
	}).success(function(data){
		displayMatches(data)
	})
		.fail(function(){
		console.log("boo!")
	})
}

function displayMatches(matchArray){
	console.log(matchArray)
}