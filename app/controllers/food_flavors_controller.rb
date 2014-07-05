class FoodFlavorsController < ApplicationController
  respond_to :json
  def index
    respond_with FoodFlavor.all
  end
end