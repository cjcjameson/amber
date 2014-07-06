$(document).ready(function(){
	bindEvents()
})

function bindEvents(){
	$('#search_form').on('submit', '#search_genres', getGenres)

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
	$('#search_results').empty()
	
	for (var match = 0; match < matchArray.length; match ++){
		var name = matchArray[match].name
		var genre = $('#genre_template').children().clone()
		genre.append("<p>"+name+"</p>")
		$('#search_results').append(genre)
	}

}