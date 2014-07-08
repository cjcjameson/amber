class BeerGenresController < ApplicationController
	def search
		flavors = params[:flavors]

		unless flavors && flavors.length > 0
				render text: "please select a flavor profile", status: 422
				return
		end

		best_match_genres = GenreCalculator.new(flavors).get_best_genre_matches

		render json: best_match_genres
	end

	def index
		@beer_genres = BeerGenre.all
	end


end