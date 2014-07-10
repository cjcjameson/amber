BeerGenres.View = function(){

}
BeerGenres.View.prototype = {
	drawGenre: function(dom){
		$('#search_results').empty()
  	$('#search_results').append(dom)
	}
}
