class BeerStyle < ActiveRecord::Base
	belongs_to :beer_genre

	validates_presence_of :name
end