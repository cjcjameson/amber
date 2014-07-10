Maps.View = function(){

}
Maps.View.prototype = {
	showZipForm: function(event) {
  var genre_id = event.target.dataset.id
  var genre = $('#'+genre_id).clone()
  zipcodeController = new Zipcodes.Controller(new Zipcodes.View(), genre_id)
  $('#search_results').empty()
  // $('#beer_results').empty()
  $('#search_results').append(genre)
  // $('#beer_results').append('<form action="/location_lookup/result" class="zip_form" method="post" data-id="'+genre_id+'"> <p><input id="zipcode" name="zipcode" type="text" placeholder="postal code" /></p> <p><input name="commit" class="zip_code_button" type="submit" value="search" data-id="'+genre_id+'" /></p> </form>')
  event.preventDefault();
	},


}