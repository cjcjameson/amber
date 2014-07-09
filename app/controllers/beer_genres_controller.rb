class BeerGenresController < ApplicationController
	def search
		flavors = params[:flavors]

		unless flavors && flavors.length > 0
				redirect_to root_path, :notice => 'Please select a flavor profile, you donut!'
				return
		end
		@best_match_genres = GenreCalculator.new(flavors).get_best_genre_matches
	end

	def index
		@beer_genres = BeerGenre.all
	end

end