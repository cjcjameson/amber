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
	}).success(displayBeers)
		.fail(function(){
		console.log("boo!")
	})
}


function displayGenreMatches(matchArray){
	$('#search_results').empty()
	
	for (var match = 0; match < matchArray.length; match ++){
		var name = matchArray[match].name
		debugger
		var description = matchArray[match].description
		var genre = $('#genre_template').children().clone()
		genre.addClass(''+name+'')
		genre.append("<h4>"+name+"</h4>")
		genre.append('<p>'+description+'</p>')
		genre.append("<button id='"+name+"' class='beer_search absolute'>Get Suggestions!</button>")
		$('#search_results').append(genre)
	}
}


function displayBeers(data){
	$('.beer_list').empty();
	var beers = data.beers
	for (var i=0; i<beers.length; i++){
		$('.beer_list').append('<li>'+ beers[i].name +'</li>')
	}
}