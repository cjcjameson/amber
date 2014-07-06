class BeersController < ApplicationController
  respond_to :json
	def search
		@beer_style = params[:beer_style]
	end

  def index
    respond_with Beer.all
  end

  def show
    respond_with Beer.find(params[:id])
  end
end