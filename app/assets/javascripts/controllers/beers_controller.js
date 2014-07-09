function BeersController(view){
	this.view = view;
	this.bindView()
}
BeersController.prototype = {
	bindView: function(){
		$('#search_results').on('click', '.beer_search_button', this.getBeers.bind(this) )
	},
	getBeers: function(event){
		var genre = this.captureChosenGenre(event.target.dataset.id)
		this.clearGenres()
		this.appendChosenGenre(genre)
		event.preventDefault();
		this.ajaxSearch()
	},
	captureChosenGenre: function(id){
		return $('#'+id).clone()
	},
	clearGenres: function(){
		this.view.empty($('#search_results'))
	},
	appendChosenGenre: function(genre){
		$('#search_results').append(genre)
	},
	ajaxSearch: function(){
		$.ajax({
		url: '/beers/search',
		method: 'GET',
		data: {genre: event.target.id},
		dataType: 'json'
		}).success(this.displayBeers.bind(this))
	},
	displayBeers: function(data){
		var beers = data.beers
		this.view.empty($('#beer_results'))
		for (var sample = 0; sample < beers.length; sample++){
			var beer = new Beer(beers[sample].beers)
			this.view.drawBeer(beer)
		}		
	}
};