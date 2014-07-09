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

  	it "returns a status of 422 if not given flavors params" do
   		get :search, {foo: ["spicy"]}
  	  expect(response.status).to eq(422)
  	end

  	it "renders the text 'Please select a flavor profile' if no flavors are selected" do
   		get :search, {flavors: []}
  	  expect(response.body).to have_content('Please select a flavor profile')
  	end

  	it "returns a status of 422 if flavors params is an empty array" do
   		get :search, {flavors: []}
  	  expect(response.status).to eq(422)
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