Maps.View = function(){

}
Maps.View.prototype = {
	createCanvas: function(){
		var map = $('#map_template').children().clone()
  	$('#search_results').append(map)
	}
}