function GenresController(view){
	this.view = view;
	this.bindAjax()
}

GenresController.prototype = {
	displayGenreMatches: function(matchArray){
		this.view.empty($('#search_results'))
		this.view.draw($('#search_results'),'<div id="genre_results"></div>')
		that = this
		for (var match = 0; match < matchArray.length; match ++){
			var name = matchArray[match].name
			var description = matchArray[match].description
			var genre = $('#genre_template').children().clone()
			that.view.draw(genre,"<h4 class='centered_text'>"+name+"</h4>")
			that.view.draw(genre,'<p class="small_side_margins">'+description+'</p>')
			that.view.draw(genre,"<button id='"+name+"' class='beer_search_button absolute'>Get Suggestions!</button>")
			that.view.draw($('#genre_results'), genre)
		}
		this.view.draw($('#genre_results'),'<div id="beer_results" class="clear_floats">')
	},
	getGenres: function(e, data, status, xhr){
		genresController.displayGenreMatches(data)
		// to be refactored, consult steven
	},
	bindAjax: function(){
		$('#search_form_holder').on("ajax:success",'#search_genres',this.getGenres)
		$('#search_form_holder').on("ajax:error",'#search_genres',this.failedResponse)
	},
	failedResponse: function(){
		console.log("Something went wrong!")
	}
}