class BeerGenre < ActiveRecord::Base
	attr_accessible :name
	has_many :beer_styles
	has_many :matches
	has_many :food_flavors, :through => :matches

	validates_presence_of :name
end