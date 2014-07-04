class BeerStyle < ActiveRecord::Base
	has_many :beer_search_terms

	validates_presence_of :name
end