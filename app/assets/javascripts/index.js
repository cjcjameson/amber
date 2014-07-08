$(document).ready(function(){
	bindEvents();
})

function bindEvents(){
	$('#search_form_holder').on("ajax:success",'#search_genres',getGenres)
	$('#search_form_holder').on("ajax:error",'#search_genres',failedResponse)
	$('#search_results').on('click', '.beer_search_button', getBeers)
  $('.beer_modal_show').on('click',overlay)
}

function getGenres(e, data, status, xhr){
	displayGenreMatches(data)
}
function failedResponse(){
	console.log("Something went wrong!")
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
	$('#search_results').append('<div id="genre_results"></div>')
	for (var match = 0; match < matchArray.length; match ++){
		var name = matchArray[match].name
		var description = matchArray[match].description
		var genre = $('#genre_template').children().clone()

		genre.append("<h4 class='centered_text'>"+name+"</h4>")
		genre.append('<p class="small_side_margins">'+description+'</p>')
		genre.append("<button id='"+name+"' class='beer_search_button absolute'>Get Suggestions!</button>")
		$('#genre_results').append(genre)
	}
	$('#genre_results').append('<div id="beer_results" class="clear_floats">')
}


function displayBeers(data){
	debugger
	$('#beer_results').empty();
	var beers = data
	
	for (var sample = 0; sample < beers.length; sample++){
		var sampleBeer = $('#beer_template').children().clone()
		var name = beers[sample].name
		var description = beers[sample].description
		var abv = beers[sample].abv
		var style = beers[sample].style
		var imgUrl = beers[sample].label_url
		sampleBeer.append("<h4>"+name+"</h4>")
		sampleBeer.append("<h6>"+style+"</h6>")
		sampleBeer.append("<p>"+description+"</p>")
		sampleBeer.append("<img src='"+imgUrl+"'>")
		$('#beer_results').append(sampleBeer)

	}


}
function overlay() {
	debugger
	$('#overlay').toggleClass('modal_show')
}