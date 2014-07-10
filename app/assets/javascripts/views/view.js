function View(){
};

View.prototype = {
	empty: function(target){
		target.empty()
	},
	displayBeers: function(beers){
		this.empty($('#beer_results'))
		for (var i = 0; i < beers.length; i++){
			this.drawBeer(beers[i])

		}
	},
	drawBeer: function(beer){
			var sampleBeer = $('#beer_template').children().clone()
			sampleBeer.append("<img src='"+beer.label_url+"' class='float_left label_pic two columns'><div class='float_left ten columns beer_info'><div class='beer_title'><div class='inline beer_name'>"+beer.name+"</div><div class='inline beer_subtitle'>"+beer.abv+"% - "+beer.style+"</div></div><div class='beer_description'><br>"+beer.description+"</div></div>")
			sampleBeer.addClass('sixteen columns')
			$("#beer_results").append(sampleBeer)
	}
}