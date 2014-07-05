class Match < ActiveRecord::Base
	belongs_to :beer_genre
	belongs_to :food_flavor

	validates_presence_of :name
end