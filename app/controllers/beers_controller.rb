class BeersController < ApplicationController
  respond_to :json
	def search
    respond_with Beer.where('category = ?', params[:genre])
  end

  def show
    @genre = BeerGenre.find(params[:id]).name
    @beers = Beer.where('category = ?', @genre)
  end
end