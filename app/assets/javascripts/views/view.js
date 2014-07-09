function View(){
};

View.prototype = {
	empty: function(target){
		target.empty()
	},
	drawBeer: function(beer){
			var sampleBeer = $('#beer_template').children().clone()
			sampleBeer.append("<img src='"+beer.label_url+"' class='float_left label_pic two columns'><div class='float_left ten columns'><h3 class='inline'>"+beer.name+"</h3><h5 class='inline'>"+beer.abv+"% - "+beer.style+"</h5><p>"+beer.description+"</p></div>")
			sampleBeer.addClass('sixteen columns')
			$("#beer_results").append(sampleBeer)
	}
}