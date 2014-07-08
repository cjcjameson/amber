class HomeController < ApplicationController
	def index
		@flavors = FoodFlavor.all
	end
end