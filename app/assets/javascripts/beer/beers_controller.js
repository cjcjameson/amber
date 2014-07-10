Beers.Controller = function(view){
	this.view = view;
	this.beers = [];
	this.bindView()
}

Beers.Controller.prototype = {
	bindView: function(){
		$('#search_results').on('click', '.beer_search_button', this.getBeers.bind(this) )
	},
	getBeers: function(event){
		var genre = this.captureChosenGenre(event.target.dataset.id)
		this.clearGenres()
		this.appendChosenGenre(genre)
		event.preventDefault();
		this.beers=[]
		this.ajaxSearch()
	},
	captureChosenGenre: function(genreId){
		return $('#'+genreId).clone()
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
		}).success(function(data){
			var beers = data.beers
			for (var i = 0; i < beers.length; i++){
				var beer = new Beer(beers[i].beers)
				this.beers.push(beer)
			}	
			this.view.displayBeers(this.beers)
		}.bind(this))
	}
};