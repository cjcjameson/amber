class FoodFlavor < ActiveRecord::Base
  attr_accessible :name
  has_many :matches
  has_many :beer_genres, :through => :matches
end
