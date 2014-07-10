Zipcodes.View = function(){
}

Zipcodes.View.prototype = {
	drawForm: function(genre_id){
		 $('#beer_results').empty()
		 $('#beer_results').append('<form action="/location_lookup/result" class="zip_form" method="post" data-id="'+genre_id+'"> <p><input id="zipcode" name="zipcode" type="text" placeholder="postal code" /></p> <p><input name="commit" class="zip_code_button" type="submit" value="search" data-id="'+genre_id+'" /></p> </form>')
	},
	clearForm: function(){
		 $('#beer_results').empty()
	},
	regenerateForm: function(data){
	  $('.alert').empty()
	  $('#beer_results').append('<p class="alert">Please input a valid postal code</p>')
	}
}