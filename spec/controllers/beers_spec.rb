require 'spec_helper'

describe BeersController do
	context "#search" do
		it "gets a beer style in" do
			get :search, {beer_style: "IPA"}
			expect(assigns(:beer_style)).to eq("IPA")
		end
	end
end