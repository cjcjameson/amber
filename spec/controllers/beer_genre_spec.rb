require 'spec_helper'

describe BeerGenresController do

	context "#search" do
		before (:each) do
			spicy = FactoryGirl.create(:food_flavor)
			ipa = FactoryGirl.create(:beer_genre)
			match = Match.create(food_flavor: spicy, beer_genre: ipa)
		end

		it "renders search template if given valid params" do
   		get :search, {flavors: ["spicy"]}
   		expect(response).to render_template(:search)
  	end

  	it "redirects to home page and displays notice if not given flavors params" do
   		get :search, {foo: ["spicy"]}
  	  expect(response).to include("Please select a flavor profile, you donut!")
  	end

		it "assigns an array of beers genres if given valid params" do
			get :search, {flavors: ["spicy"]}
			expect(assigns(:best_match_genres).class).to eq( Array )
		end
	end

	context "#index" do
		before (:each) do
			spicy = FactoryGirl.create(:food_flavor)
			ipa = FactoryGirl.create(:beer_genre)
			match = Match.create(food_flavor: spicy, beer_genre: ipa)
		end

		it "renders the index template" do
			get :index
   		expect(response).to render_template(:index)
		end

		it "assigns an array of all beer genres" do
			get :index
   		expect(assigns(:beer_genres)).to eq(BeerGenre.all)
		end
	end
end