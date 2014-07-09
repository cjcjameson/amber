class BeersController < ApplicationController
  respond_to :json
	def search
    sorted_beers = BeerPrioritizer.new(params[:genre]).find_beers
    respond_with sorted_beers
  end

  def show
    @genre = BeerGenre.find(params[:id]).name
    @beers = Beer.where('category = ?', @genre)
  end
end