require 'spec_helper'

describe GenreCalculator do
	before (:each) do
		spicy = FactoryGirl.create(:food_flavor)
		ipa = FactoryGirl.create(:beer_genre)
		match = Match.create(food_flavor: spicy, beer_genre: ipa)
	end

	context "#get_best_genre_matches" do
		it "responds with an array of BeerGenres when given a list of flavors" do
			expect(GenreCalculator.new(["spicy"]).get_best_genre_matches.first).to be_instance_of(BeerGenre)
		end

		it "responds with an array of BeerGenres when given a list containing at least one valid flavor" do
			expect(GenreCalculator.new(["foo", "spicy", "bar"]).get_best_genre_matches.first).to be_instance_of(BeerGenre)
		end

		it "responds with an empty array when given a list of invalid flavors" do
			expect(GenreCalculator.new(["foo"]).get_best_genre_matches).to eq([])
		end
	end
end