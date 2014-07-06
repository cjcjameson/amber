require 'spec_helper'

describe BeerGenresController do
	context "#search" do
		before (:each) do
			spicy = FoodFlavor.create(name: "spicy")
			ipa = BeerGenre.create(name: "IPA")
			match = Match.create(food_flavor: spicy, beer_genre: ipa)
		end

		it "prepares a beer genre" do
			get :search, {flavor1: "spicy"}
			expect(assigns(:beer_genres).first.name).to include("IPA")
		end

		it "returns successfully" do
			get :search, {flavor1: "spicy"}
			expect(response).to be_success
		end

		it "returns JSON recommending IPA" do
			get :search, {flavor1: "spicy"}
			beer_genres = JSON.parse(response.body)
			# p beer_genres
			# names = beer_genres.map{ |g| g.name }
			expect(beer_genres.to_s).to include("IPA")
		end

		it "returns an error if not provided any flavorful search terms" do
			response = get :search
			expect(response.status).to be >= 400
		end
	end
end