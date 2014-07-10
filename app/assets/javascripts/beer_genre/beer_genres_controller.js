BeerGenres.Controller = function(view){
	this.view = view
	this.initializeEvent()
}
BeerGenres.Controller.prototype = {
	initializeEvent: function(){
		$('#search_results').on('click', '.beer_map_button',function(){
			event.preventDefault()
			// debugger
			this.createGenre(event.target.dataset.id)
		}.bind(this))
	},
	createGenre: function(genre_id){
		console.log('inside createGenre')
		var genre = new BeerGenre(genre_id)
		this.view.drawGenre(genre.dom)
	}
}