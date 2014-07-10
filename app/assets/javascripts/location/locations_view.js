Locations.View = function(){
}
Locations.View.prototype = {
	drawAddresses: function(arr){
		for (i = 0; i < 5; i ++){
			$('#search_results').append('<div class="business_box"><h5><a href="'+arr[i].url+'">'+arr[i].name+'</a></h5><div class="rating_image"><img src="'+arr[i].rating_img_url_small+'"></div><div class="side_image"><img src="'+arr[i].image_url+'"></div><p>'+arr[i].address+'</p></div>')
		}
	}
}