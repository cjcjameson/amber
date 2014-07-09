require 'spec_helper'

describe Seed do

	context "#parse_beer_data" do
		it "returns an array when given a json format string" do
			sample_api_response = File.read("#{Rails.root}/spec/dummy_api_resp.json")
			expect(Seed.parse_beer_data(sample_api_response)).to be_instance_of(Array)
		end
	end

end