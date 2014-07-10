Maps.View = function(){

}
Maps.View.prototype = {
	showZipForm: function(event) {
  var genre_id = event.target.dataset.id
  var genre = $('#'+genre_id).clone()
  zipcodeController = new Zipcodes.Controller(new Zipcodes.View(), genre_id)
  $('#search_results').empty()
  $('#search_results').append(genre)
  event.preventDefault();
	}


}