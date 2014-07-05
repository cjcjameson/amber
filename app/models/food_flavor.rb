class FoodFlavor < ActiveRecord::Base
  attr_accessible :name
  has_many :beer_genres, :through => :goes_well_with
end
