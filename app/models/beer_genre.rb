class BeerGenre < ActiveRecord::Base
	has_many :beer_styles

	validates_presence_of :name
end