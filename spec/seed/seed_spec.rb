require 'spec_helper'

describe Seed do
	context "#genres" do
		
		it "creates BeerGenre objects when passed a valid json formatted string" do
			genre_string = '{"beer_genres":
	      [{"name": "Cream Ale",
	      "description": "Smooth malty sweetness and balanced bitterness. Pairs perfectly with sweet, hot, or spicy foods including many Asian dishes, chili, mango or jalapeño salsa."}]}'
			expect{Seed.genres(genre_string)}.to change{BeerGenre.count}.by(1)
		end
	end


	context "#parse_beer_data" do
		it "returns an array when given a json format string" do
			sample_api_response = File.read("#{Rails.root}/spec/dummy_api_resp.json")
			expect(Seed.parse_beer_data(sample_api_response)).to be_instance_of(Array)
		end
	end

end