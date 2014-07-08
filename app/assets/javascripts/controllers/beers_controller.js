function BeersController(view){
	this.view = view;
	this.bindView()
}
BeersController.prototype = {
	bindView: function(){
		$('#search_results').on('click', '.beer_search_button', this.getBeers)
	},
	getBeers: function(){
		$.ajax({
		url: '/beers/search',
		method: 'GET',
		data: {genre: event.target.id},
		dataType: 'json'
	}).success(beersController.displayBeers)
		.fail(function(){
		console.log("boo!")
	})
	},
	displayBeers: function(data){
		that = beersController
		that.view.empty($('#beer_results'))
		for (var sample = 0; sample < data.length; sample++){
			var sampleBeer = $('#beer_template').children().clone()
			var name = data[sample].name
			var description = data[sample].description
			var abv = data[sample].abv
			var style = data[sample].style
			var imgUrl = data[sample].label_url
			that.view.draw(sampleBeer,"<h4>"+name+"</h4>")
			that.view.draw(sampleBeer,"<h6>"+style+"</h6>")
			that.view.draw(sampleBeer,"<p>"+description+"</p>")
			that.view.draw(sampleBeer,"<img src='"+imgUrl+"'>")
			that.view.draw($('#beer_results'),sampleBeer)
		}
	}


}