class BeersController < ApplicationController
  respond_to :json
	def search
		# @beer_style = params[:beer_style]
    respond_with Beer.where('category = ?', params[:genre]).to_json
  end

  def index
    respond_with Beer.all
  end

  def show
    @genre = BeerGenre.find(params[:id]).name
    @beers = Beer.where('category = ?', @genre)
  end
end