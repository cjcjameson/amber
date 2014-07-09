require 'spec_helper'

describe HomeController do
	context "#index" do
		before (:each) do
			FactoryGirl.create(:food_flavor)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template(:index)
		end

		it "assigns an array of all food flavors" do
			get :index
			expect(assigns(:flavors)).to eq(FoodFlavor.all)
		end

	end

end