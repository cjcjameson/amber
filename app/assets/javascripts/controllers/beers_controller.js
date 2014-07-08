function BeersController(){
	// this.view = view
	this.bindView()
}
BeersController.prototype = {
	bindView: function(){
		$('#search_results').on('click', '.beer_search_button', this.getBeers)
	},
	getBeers: function(){
		$.ajax({
		url: 'beers/search',
		method: 'GET',
		data: {genre: event.target.id},
		dataType: 'json'
	}).success(beersController.displayBeers)
		.fail(function(){
		console.log("boo!")
	})
	},
	displayBeers: function(data){
		$('#beer_results').empty();
		var beers = data
		for (var sample = 0; sample < beers.length; sample++){
			var sampleBeer = $('#beer_template').children().clone()
			var name = beers[sample].name
			var description = beers[sample].description
			var abv = beers[sample].abv
			var style = beers[sample].style
			var imgUrl = beers[sample].label_url
			sampleBeer.append("<h4>"+name+"</h4>")
			sampleBeer.append("<h6>"+style+"</h6>")
			sampleBeer.append("<p>"+description+"</p>")
			sampleBeer.append("<img src='"+imgUrl+"'>")
			$('#beer_results').append(sampleBeer)
		}
	}


}