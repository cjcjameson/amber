class BeerGenresController < ApplicationController
	def search
		flavor_keys = params.keys.select { |k| k =~ /flavor/ }
		if flavor_keys.length == 0
			render file: "public/422", status: 422
		end
		@food_flavors = flavor_keys.map { |f| params[f] }
	end
end