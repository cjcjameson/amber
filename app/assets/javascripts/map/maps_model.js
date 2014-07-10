function Map(mapJson){
	this.lat = mapJson.latitude
	this.lng = mapJson.longitude
	this.geocoder = new google.maps.Geocoder()
	this.latlng = new google.maps.LatLng(this.lat, this.lng)
	this.mapOptions = {
    zoom: 10,
    center: this.latlng
  }
}