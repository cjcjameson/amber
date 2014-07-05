require 'spec_helper'

describe BeerGenresController do
	context "#search" do
		before (:each) do
			spicy = FoodFlavor.create(name: "spicy")
			ipa = BeerGenre.create(name: "IPA")
			match = Match.create(food_flavor: spicy, beer_genre: ipa)
		end

		it "gets food flavors in" do
			get :search, {flavor1: "spicy"}
			expect(assigns(:beer_genres)).to include("IPA")
		end

		it "returns an error if not provided any flavorful search terms" do
			response = get :search
			expect(response.status).to be >= 400
		end
	end
end