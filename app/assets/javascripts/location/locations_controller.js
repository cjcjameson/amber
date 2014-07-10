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
	}
}