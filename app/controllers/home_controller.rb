class HomeController < ApplicationController
	def index
		@flavors = FoodFlavor.all.sort_by {|flavor| flavor.name}
    @notice = notice
	end
end