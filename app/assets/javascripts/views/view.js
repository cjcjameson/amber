function View(){
};

View.prototype = {
	empty: function(target){
		target.empty()
	},
	drawBeer: function(beer){
			var sampleBeer = $('#beer_template').children().clone()
			debugger
			sampleBeer.append("<h4>"+beer.name+"</h4><br><h6>"+beer.style+"</h6><br><p>"+beer.description+"</p><br><img src='"+beer.label_url+"'>")
			$("#beer_results").append(sampleBeer)
	}
}