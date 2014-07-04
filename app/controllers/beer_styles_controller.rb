class BeerStylesController < ApplicationController
	def search
		@food_flavors = params
		p @food_flavors
	end
end