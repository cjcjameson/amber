class FoodFlavor < ActiveRecord::Base
  attr_accessible :name
  has_many :matches
  has_many :beer_genres, :through => :matches
  validates_presence_of :name
  validates :name, length: { minimum: 2 }
end
