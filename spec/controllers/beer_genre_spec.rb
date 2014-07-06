require 'spec_helper'

describe BeerGenresController do
	context "#search" do
		before (:each) do
			spicy = FoodFlavor.create(name: "spicy")
			ipa = BeerGenre.create(name: "IPA")
			match = Match.create(food_flavor: spicy, beer_genre: ipa)
		end

		it "prepares a beer genre" do
			xhr :get, :search, flavor1: "spicy", format: "json"

			expect(assigns(:beer_genres).first.name).to include("IPA")
		end

		it "returns successfully" do
			xhr :get, :search, flavor1: "spicy", format: "json"
			expect(response).to be_success
		end

		it "returns JSON containing IPA" do
			xhr :get, :search, flavor1: "spicy", format: "json"

			beer_genres = JSON.parse(response.body)
			expect(beer_genres.to_s).to include("IPA")
		end

		it "returns an error if not provided any flavorful search terms" do
			xhr :get, :search, invalid_param: "spicy", format: "json"
			expect(response.status).to be >= 400
		end
	end
end