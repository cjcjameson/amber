function View(){
};

View.prototype = {
	empty: function(target){
		target.empty()
	},
	drawBeer: function(beer){
			var sampleBeer = $('#beer_template').children().clone()
			sampleBeer.append("<img src='"+beer.label_url+"' class='float_left label_pic two columns'><div class='float_left ten columns beer_info'><div class='beer_title'><div class='inline beer_name'>"+beer.name+"</div><div class='inline beer_subtitle'>"+beer.abv+"% - "+beer.style+"</div></div><div class='beer_description'><br>"+beer.description+"</div></div>")
			sampleBeer.addClass('sixteen columns')
			$("#beer_results").append(sampleBeer)
	}
}