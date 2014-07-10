Zipcodes.Controller = function(view, genre_id){
	this.view = view
	this.initializeEvent(genre_id)
}

Zipcodes.Controller.prototype = {
	initializeEvent: function(genre_id){
		var zipcode = new Zipcode(genre_id)
		$('#search_results').on('click', '.beer_map_button', this.view.drawForm(zipcode.genre_id))
	}
}