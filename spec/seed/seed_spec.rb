require 'spec_helper'

describe Seed do
	describe "when seeding genres" do
		it "creates BeerGenre objects when passed a valid json formatted string" do
			genre_string = '[{"name": "Cream Ale","description": "So full of foo, this genre goes well with bar"}]'
			expect{Seed.genres(genre_string)}.to change{BeerGenre.count}.by(1)
		end
	end

	describe "when seeding flavors" do
		it "creates FoodFlavor objects when passed a valid json formatted string" do
			flavors = '[{"name": "salty"},{"name": "spicy"}]'
			expect{Seed.flavors(flavors)}.to change{FoodFlavor.count}.by(2)
		end
	end

	describe "when seeding beer objects" do
		let(:sample_api_response){File.read("#{Rails.root}/spec/dummy_api_resp.json")}
		let(:unverified_beer){JSON.parse(File.read("#{Rails.root}/spec/unverified_beer_sample.json"))}
		let(:verified_beer){JSON.parse(File.read("#{Rails.root}/spec/verified_beer_sample.json"))}

		context "when parsing beer data api response" do
			it "returns a collection of beer information when given a json format string" do
				expect(Seed.parse_beer_data(sample_api_response)).to be_instance_of(Array)
			end
		end

		context "when creating beer objects with parsed beer data" do
			it "only creates a beer if data has a status of 'verified'" do
				expect{Seed.create_beer_objects(unverified_beer)}.to_not change{Beer.count}
			end
			it "only creates a beer if data has a status of 'verified'" do
				expect{Seed.create_beer_objects(verified_beer)}.to change{Beer.count}.by(1)
			end
		end

		context "when changing a beer category" do
			it "uses the default category of the beer if it is not something we want to change" do
				beer = FactoryGirl.create(:beer, style: "Pond Water")
				expect(Seed.set_beer_category(beer, beer.style).category).to eq("Pond Water")
			end
			it "changes a beer category from 'American-Style Cream Ale or Lager' to 'Cream Ale / Blonde Ale'" do
				beer = FactoryGirl.create(:beer, style: "American-Style Cream Ale or Lager")
				expect(Seed.set_beer_category(beer, beer.style).category).to eq("Cream Ale / Blonde Ale")
			end
		end
	end
end




