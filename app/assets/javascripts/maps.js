function showZipForm(event) {
  var genre_id = event.target.dataset.id
  var genre = $('#'+genre_id).clone()
  $('#search_results').empty()
  $('#beer_results').empty()
  $('#search_results').append(genre)
  $('#beer_results').append('<form action="/location_lookup/result" class="zip_form" method="post" data-id="'+genre_id+'"> <p><input id="zipcode" name="zipcode" type="text" placeholder="postal code" /></p> <p><input name="commit" class="zip_code_button" type="submit" value="search" data-id="'+genre_id+'" /></p> </form>')
  event.preventDefault();
}

var geocoder;
var map;
var infoWindow;

function yelpCall(event) {
  var genre_id = event.target.dataset.id
  var genre = $('#'+genre_id).clone()
  $('#search_results').empty()
  $('#search_results').append(genre)
  var zipcode = $(this).parent().parent().serialize().replace("zipcode=", "")
  event.preventDefault();
  $.ajax({
    url: '/location_lookup/result',
    method: 'get',
    data: {genre: genre_id, zipcode: zipcode},
    dataType: 'json'
  }).done(function(data){
    initializeMaps(data)
  }).fail(function(data){
    regenerateForm(data)
  })
}

function regenerateForm(data){
  $('.alert').empty()
  $('#beer_results').append('<p class="alert">Please input a valid zipcode</p>')
}

function initializeMaps(data) {
  $('#beer_results').empty()
  var map = $('#map_template').children().clone()
  $('#search_results').append(map)
  var lat = data.latitude
  var lng = data.longitude
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(lat, lng);
  var mapOptions = {
    zoom: 10,
    center: latlng
  };
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  infoWindow = new google.maps.InfoWindow({
          content: "..."
        });
  var addresses = data.data
  var addressList = [];
  for (i = 0; i < 5; i ++) {
    var url = addresses[i].url
    var name = addresses[i].name
    var image = addresses[i].image_url
    var rating_image = addresses[i].rating_img_url_small
    var addressItem = addresses[i].location.display_address.join(" ")
    addressList.push(addressItem);
    $('#search_results').append('<div class="business_box"><h5><a href="'+url+'">'+name+'</a></h5><div class="rating_image"><img src="'+rating_image+'"></div><div class="side_image"><img src="'+image+'"></div><p>'+addressItem+'</p></div>')
  }
  for (i in addressList){
    var address = addressList[i]
    geocoder.geocode({'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            html: '<div class="infoWindow"><p>'+results[0].formatted_address+'</p></div>'
        });
        google.maps.event.addListener(marker, 'click', function(){
          infoWindow.setContent(this.html);
          infoWindow.open(map, this);
        });
      } else {
        console.log("Geocode was not successful for the following reason: " + status);
      }
    });
  }
}