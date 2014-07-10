Locations.Controller = function(view, arr){
	this.view = view
	this.addresses = arr
	this.addressList = []
	this.collectAddresses()
}

Locations.Controller.prototype = {
	collectAddresses: function(){
		for (i = 0; i < 5; i ++) {
      var address = new Location(this.addresses[i])
      this.addressList.push(address);
    }
    this.view.drawAddresses(this.addressList)
	},
	plotLocations: function(infoWindow, model, map){
		for (i in this.addressList){
      var location = this.addressList[i]
      model.geocoder.geocode({'address': location.address}, function(results, status) {
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
        }
      });
    }
	}
}