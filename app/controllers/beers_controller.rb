class BeersController < ApplicationController
  respond_to :json
	def search
    beers = Beer.where('category = ?', params[:genre])
    sorted_beers = BeerSorting.new(beers).prioritize
    respond_with sorted_beers
  end

  def show
    @genre = BeerGenre.find(params[:id]).name
    @beers = Beer.where('category = ?', @genre)
  end
end