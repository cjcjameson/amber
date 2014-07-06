class HomeController < ApplicationController
	def index
		@flavors = FoodFlavor.all
	end

  def start
  end
end