class BeerGenre < ActiveRecord::Base
	attr_accessible :name
	has_many :beer_styles

	validates_presence_of :name
end