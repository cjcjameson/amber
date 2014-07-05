class BeerGenre < ActiveRecord::Base
	attr_accessible :name
	has_many :beer_styles
	has_many :food_flavors, :through => :goes_well_with

	validates_presence_of :name
end