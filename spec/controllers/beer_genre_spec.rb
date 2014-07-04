require 'spec_helper'

describe BeerGenresController do
	context "#search" do
		it "gets food flavors in" do
			get :search, {flavor1: "salty", flavor2: "sweet"}
			expect(assigns(:food_flavors).keys).to include("flavor1")
		end

		it "returns an error if not provided any search terms" do
			pending "wait until we rename the styles and genres"
		end

		it  "returns an error if search terms are not flavors" do
			pending "wait until we rename the styles and genres"
		end
	end
end