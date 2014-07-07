$(document).ready(function(){
	bindEvents()
	initialize()
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
	}).success(displayGenreMatches)
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
		var beers = data.beers
		var genre = beers[0].category
		var box = $('.genre_description.'+genre+'')
		box.append('<ul class='+genre+'></ul>')
		$('button#'+genre+'').remove();
		for (var i=0; i<beers.length; i++){
			$('ul.'+genre+'').append('<li>'+beers[i].name+'</li>')
		}
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
		genre.addClass(''+name+'')
		genre.append("<p'>"+name+"</p>")
		genre.append("<button id='"+name+"' class='beer_search'>Get Suggestions!</button>")
		$('#search_results').append(genre)
	}
}

var geocoder;
var map;
var infoWindow;

function initialize() {
	var lat = $('.lat').html();
	var lng = $('.lng').html();
	geocoder = new google.maps.Geocoder();
	var latlng = new google.maps.LatLng(lat, lng);
	var mapOptions = {
		zoom: 10,
		center: latlng
	}
	map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
	var addresses = $('.address')
	var addressList = []
  infoWindow = new google.maps.InfoWindow({
        	content: "..."
        })
	for (i = 0; i < 10; i ++) {
		var addressItem = $(addresses[i]).html()
		addressList.push(addressItem)
	}
	for (i in addressList){
		var address = addressList[i]
		geocoder.geocode({'address': address}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
           	html: '<div class="infoWindow">' + results[0].formatted_address + '</div>'
        });
        google.maps.event.addListener(marker, 'click', function(){
        	infoWindow.setContent(this.html)
        	infoWindow.open(map, this)
        });
      } else {
        console.log("Geocode was not successful for the following reason: " + status);
      }
		});
	}
}