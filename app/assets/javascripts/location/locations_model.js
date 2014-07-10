function Location(locationJson){
	  this.url = locationJson.url
    this.name = locationJson.name
 		this.image_url = locationJson.image_url
    this.rating_img_url_small = locationJson.rating_img_url_small
    this.address = locationJson.location.display_address.join(" ")
}