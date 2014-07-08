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

		$.ajax({
		url: '/beers/search',
		method: 'GET',
		data: {genre: event.target.id},
		dataType: 'json'
		}).success(this.displayBeers.bind(this))
	},
	captureChosenGenre: function(id){
		return $('#'+id).clone()
	},
	clearGenres: function(){
		$('#search_results').empty()
	},
	appendChosenGenre: function(genre){
		$('#search_results').append(genre)
	},
	displayBeers: function(data){
		var beers = data.beers
		this.view.empty($('#beer_results'))
		for (var sample = 0; sample < beers.length; sample++){
			var sampleBeer = $('#beer_template').children().clone()
			var beer = beers[sample].beers
			var name = beer.name
			var description = beer.description
			var abv = beer.abv
			var style = beer.style
			var imgUrl = beer.label_url
			this.view.draw(sampleBeer,"<h4>"+name+"</h4>")
			this.view.draw(sampleBeer,"<h6>"+style+"</h6>")
			this.view.draw(sampleBeer,"<p>"+description+"</p>")
			this.view.draw(sampleBeer,"<img src='"+imgUrl+"'>")
			this.view.draw($('#beer_results'),sampleBeer)
		}
	}


}