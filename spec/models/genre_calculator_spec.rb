require 'spec_helper'

describe GenreCalculator do
	before (:each) do
		spicy = FactoryGirl.create(:food_flavor)
		pale = FactoryGirl.create(:beer_genre)
		match = Match.create(food_flavor: spicy, beer_genre: pale)


		sweet = FactoryGirl.create(:food_flavor, name: "sweet")
		ipa = FactoryGirl.create(:beer_genre, name: "ipa")
		match = Match.create(food_flavor: sweet, beer_genre: ipa)
	end

	describe "#get_best_genre_matches" do
		describe "spicy GenreCalculator" do
			let(:spicy_calc) { GenreCalculator.new(["spicy"]).get_best_genre_matches }
			it "responds with a single match" do
				expect(spicy_calc.length).to eq 1
			end
			it "responds with a collection of BeerGenres when given a list of flavors" do
				expect(spicy_calc.first).to be_instance_of(BeerGenre)
			end
		end

		describe "spicy and sweet GenreCalculator" do
			let(:spicy_sweet_calc) { GenreCalculator.new(["spicy", "sweet"]).get_best_genre_matches }
			it "responds with two matches" do
				expect(spicy_sweet_calc.length).to eq 2
			end
			it "responds with a collection of only BeerGenres when given a list of flavors" do
				expect(spicy_sweet_calc.reject { |genre| genre.class == BeerGenre }).to be_empty
			end
		end

		it "responds with a collection of BeerGenres when given a list containing at least one valid flavor" do
			expect(GenreCalculator.new(["foo", "spicy", "bar"]).get_best_genre_matches.length).to eq 1
		end

		it "responds with an empty collection when given a list of flavors that do not exist" do
			expect(GenreCalculator.new(["foo", "purple"]).get_best_genre_matches).to be_empty
		end
	end
end