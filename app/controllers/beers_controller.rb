class BeersController < ApplicationController
	def search
		@beer_style = params[:beer_style]
		p @beer_style
	end
end