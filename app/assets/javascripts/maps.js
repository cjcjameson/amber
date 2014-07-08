var geocoder;
var map;
var infoWindow;

function initializeMaps() {
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