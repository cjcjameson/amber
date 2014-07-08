$(document).ready(function(){
	bindEvents();
})

function bindEvents(){
	$('#search_results').on('click', '.beer_search_button', getBeers)
  $('.beer_modal_show').on('click',overlay)
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