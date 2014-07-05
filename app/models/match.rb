class Match < ActiveRecord::Base
	attr_accessible :beer_genre, :food_flavor, :intensity
	belongs_to :beer_genre
	belongs_to :food_flavor
end