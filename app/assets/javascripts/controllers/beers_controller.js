function BeersController(view){
	this.view = view;
	this.beers = [];

	this.initializeEvents()
}

BeersController.prototype = {
	initializeEvents: function(){
		beersController = this;
		$('#search_results .beer_search_button')
			.on('click', this.getBeers.bind(this) )

	},

	getBeers: function(event){
		event.preventDefault();
		this.chosenGenreId = event.target.dataset.id
		this.ajaxSearch(event)
	},

	ajaxSearch: function(event){
		$.ajax({
			url: '/beers/search',
			method: 'GET',
			data: {genre: event.target.id},
			dataType: 'json'
		}).success(function(data) {
			var beersJson = data.beers,
				len = beersJson.length;

			for (var i = 0; i < len; i++) {
	      this.beers.push(new Beer(beersJson[i].beers))
	    }

			this.view.displayBeers(this);
		}.bind(this))
	}
};
