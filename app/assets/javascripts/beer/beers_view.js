Beers.View = function(){
};

Beers.View.prototype = {
	empty: function(target){
		target.empty()
	},
	displayBeers: function(beers){
		this.empty($('#beer_results'))
		for (var i = 0; i < beers.length; i++){
			this.drawBeer(beers[i])
		}
		$('#beer_results').append('<div class="sixteen columns back_button_wrapper"><a href="#search_viewport"><div class="back_button">Back To Top</div></a></div>')
	},
	drawBeer: function(beer){
			var sampleBeer = $('#beer_template').children().clone()
			sampleBeer.append("<img src='"+beer.label_url+"' class='float_left label_pic two columns'><div class='float_left ten columns beer_info'><div class='beer_title'><div class='inline beer_name'>"+beer.name+"</div><div class='inline beer_subtitle'>ABV: "+beer.abv+" - "+beer.style+"</div></div><div class='beer_description'><br>"+beer.description+"</div></div>")
			sampleBeer.addClass('sixteen columns')
			$("#beer_results").append(sampleBeer)
	}
}