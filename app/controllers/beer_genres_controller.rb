class BeerGenresController < ApplicationController
	def search
		flavors = params.select { |key,flavor| key =~ /flavor/ }.values
		if flavors.length == 0
			render file: "public/422", status: 422
			return
		end
		result = Hash.new
		flavors.each do |flavor|
			genres = FoodFlavor.find_by_name(flavor).beer_genres
			genres.each do |genre|
				result[genre] ? result[genre] += 1 : result[genre] = 1
			end
		end
		result = result.sort_by{|k,v| v}.reverse #=> this gives you the nested array. [[name: count],[name:count]]
		@beer_genres = result.map{ |genre_arr| genre_arr.first } 
		
		respond_to do |format|
      format.html
      format.json { render :json => @beer_genres.to_json }
    end
  
	end
end