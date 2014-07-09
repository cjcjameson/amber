function View(){
};

View.prototype = {
	empty: function(target){
		target.empty()
	},
	drawBeer: function(beer){
			var sampleBeer = $('#beer_template').children().clone()
			sampleBeer.append("<img src='"+beer.label_url+"'><h3>"+beer.name+"</h3><h5>"+beer.abv+"</h5><h5>"+beer.style+"</h5><br><p>"+beer.description+"</p>")
			$("#beer_results").append(sampleBeer)
	}
}