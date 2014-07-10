class HomeController < ApplicationController
	def index
		@flavors = FoodFlavor.all
    @notice = notice
	end
end