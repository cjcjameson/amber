class BeerGenresController < ApplicationController
	def search
		@food_flavors = params
	end
end