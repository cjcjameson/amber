class GoesWellWith < ActiveRecord::Base
	belongs_to :beer_genre, :food_flavor

	validates_presence_of :name
end