require 'spec_helper'

describe BeerPrioritizer do
		before (:each) do
			FactoryGirl.create(:beer, label_url: nil)
			FactoryGirl.create(:beer, label_url: "/has_label")
		end

		context "when finding beers" do
			let(:result){BeerPrioritizer.new('IPA').find_beers}

			it "finds and returns beers that with a category that match the given genre" do
				expect(result.first.category).to eq('IPA')
			end

			it "truncates results to a maximum of 20" do
				25.times{FactoryGirl.create(:beer)}
				expect(result.length).to eq(20)
			end

			context "sorts the results, giving priority to beers with a label_url" do
				it "places images with labels at the front of the array" do
					expect(result.first.label_url).to_not be(nil)
				end

				it "places images with no labels at the back of the array" do
					expect(result.last.label_url).to be(nil)
				end
			end
		end
end