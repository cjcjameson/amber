class BeerSearchTerm < ActiveRecord::Base
	belongs_to :beer_style

	validates_presence_of :search_term
end