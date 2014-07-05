class BeerGenresController < ApplicationController
	def search
		flavor_keys = params.keys.select { |k| k =~ /flavor/ }
		if flavor_keys.length == 0
			render file: "public/422", status: 422
		end
		result = Hash.new
		flavor_keys.each do |flavor|
			genres = FoodFlavor.find_by_name(flavor).beer_genres
			genres.each do |genre|
				result[genre] ? result[genre] += 1 : result[genre] = 1
			end
		end
		result = result.sort_by{|k,v| v}.reverse #=> this gives you the nested array. [[name: count],[name:count]]
		@beer_genres = result.map{ |genre_arr| genre_arr.first.to_json } #=> this gives you the array of the genres in JSON, sorted by the occurence.
	end
end