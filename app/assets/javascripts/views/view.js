function View(target){
  this.target = target;
};

View.prototype = {
  displayBeers: function(dataBearer){
    var beers = dataBearer.beers,
      selectedGenredId = dataBearer.chosenGenreId;

    this.target.empty();
    this.redisplayChosenGenre(selectedGenredId);

    for (var i = 0; i < beers.length; i++) {
      this.drawBeer(beers[i]);
    }
  },

  redisplayChosenGenre: function(genreId) {
    $('#' + genreId).clone().appendTo('#search_results')
  },

	drawBeer: function(beer){
			var sampleBeer = $('#beer_template').children().clone()
			sampleBeer.append("<img src='"+beer.label_url+"' class='float_left label_pic two columns'><div class='float_left ten columns'><h3 class='inline'>"+beer.name+"</h3><h5 class='inline'>"+beer.abv+"% - "+beer.style+"</h5><p>"+beer.description+"</p></div>")
			sampleBeer.addClass('sixteen columns')
			$("#beer_results").append(sampleBeer)
	}
}
