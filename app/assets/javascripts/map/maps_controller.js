Maps.Controller = function(view){
  this.view = view
  this.initalizeEvents()
  var geocoder;
  var map;
  var infoWindow;
}

Maps.Controller.prototype = {
initalizeEvents: function(){
  mapController = this;
  $('#search_results').on('click', '.beer_map_button', this.showZipForm.bind(this))
  $('#beer_results').on('click', '.zip_code_button', this.yelpCall.bind(this))
},
showZipForm: function(event) {
  var genre_id = event.target.dataset.id
  var beerGenreController = new BeerGenres.Controller(new BeerGenres.View())
  zipcodeController = new Zipcodes.Controller(new Zipcodes.View(), genre_id)
},

yelpCall: function(event){
  var genre_id = event.target.dataset.id
  var beerGenreController = new BeerGenres.Controller(new BeerGenres.View())
  var zipcode = $('#zipcode').val()
  event.preventDefault();
  $.ajax({
    url: '/location_lookup/result',
    method: 'get',
    data: {genre: genre_id, zipcode: zipcode},
    dataType: 'json'
  }).done(function(data){
    this.initializeMaps(data, zipcodeController)
  }.bind(this)).fail(function(data){
    zipcodeController.view.regenerateForm(data)
  })
},

initializeMaps: function(data, zipCon) {
  zipCon.view.clearForm()
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

  
}






