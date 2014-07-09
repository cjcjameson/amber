function View(){
};

View.prototype = {
	empty: function(target){
		target.empty()
	},
	drawBeer: function(beer){
			var sampleBeer = $('#beer_template').children().clone()
			sampleBeer.append("<img src='"+beer.label_url+"' class='float_left'><div class='float_left'><h3>"+beer.name+"</h3><h5>"+beer.abv+"%</h5><h5>"+beer.style+"</h5><br><p>"+beer.description+"</p></div>")
			$("#beer_results").append(sampleBeer)
	}
}