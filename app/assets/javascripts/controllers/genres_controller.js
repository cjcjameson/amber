function GenresController(){
	// this.view = view;
	this.bindAjax()
}

GenresController.prototype = {
	displayGenreMatches: function(matchArray){
		alert('hey')
		// $('#search_results').empty()
		// $('#search_results').append('<div id="genre_results"></div>')
		// for (var match = 0; match < matchArray.length; match ++){
		// 	var name = matchArray[match].name
		// 	var description = matchArray[match].description
		// 	var genre = $('#genre_template').children().clone()

		// 	genre.append("<h4 class='centered_text'>"+name+"</h4>")
		// 	genre.append('<p class="small_side_margins">'+description+'</p>')
		// 	genre.append("<button id='"+name+"' class='beer_search_button absolute'>Get Suggestions!</button>")
		// 	$('#genre_results').append(genre)
		// }
		// $('#genre_results').append('<div id="beer_results" class="clear_floats">')
	},
	alerty: function(){
		alert('hey')
	}
	getGenres: function(e, data, status, xhr){
		debugger
		alerty();
		// this.displayGenreMatches;
	},
	bindAjax: function(){
		$('#search_form_holder').on("ajax:success",'#search_genres',this.getGenres)
		$('#search_form_holder').on("ajax:error",'#search_genres',failedResponse)
	}
}