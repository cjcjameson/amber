require 'spec_helper'

describe BeerPrioritizer do
		before (:each) do
			ipa = FactoryGirl.create(:beer)
		end

		context "#find_beers" do
			it "finds and returns beers that match the given genre" do
				result = BeerPrioritizer.new('IPA').find_beers
				expect(result.first.category).to eq("IPA")
			end

			
		end
end