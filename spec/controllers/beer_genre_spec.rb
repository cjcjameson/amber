require 'spec_helper'

describe BeerGenresController do
	context "#search" do
		it "gets food flavors in" do
			get :search, {flavor1: "salty", flavor2: "sweet"}
			expect(assigns(:food_flavors)).to include("salty")
		end

		it "returns an error if not provided any flavorful search terms" do
			response = get :search
			expect(response.status).to be >= 400
		end
	end
end