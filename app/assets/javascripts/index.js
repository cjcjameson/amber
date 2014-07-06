$(document).ready(function(){
	bindEvents()
})

function bindEvents(){
	$('#search_form').on('submit', '#search_genres', getGenres)
	$('#search_results').on('click', '.beer_search', getBeers)
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
		displayGenreMatches(data)
	})
		.fail(function(){
		console.log("boo!")
	})
}

function getBeers(){
	$.ajax({
		url: 'beers/search',
		method: 'GET',
		data: {genre: event.target.id},
		dataType: 'json'
	}).success(function(data){
		console.log(data)
	})
		.fail(function(){
		console.log("boo!")
	})
}


function displayGenreMatches(matchArray){
	$('#search_results').empty()
	
	for (var match = 0; match < matchArray.length; match ++){
		var name = matchArray[match].name
		var genre = $('#genre_template').children().clone()
		genre.append("<p class='white'>"+name+"</p>")
		genre.append("<button id='"+name+"' class='beer_search'>Get Suggestions!</button>")
		$('#search_results').append(genre)
	}
}