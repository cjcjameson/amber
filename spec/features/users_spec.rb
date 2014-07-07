require 'spec_helper'

feature 'users' do
  context 'create account page' do
    it 'can create account with valid params' do
      visit "/users/new"
      fill_in 'user_username', :with => "allison"
      fill_in 'user_email', :with => "allison@example.com"
      fill_in 'user_city', :with => "San Francisco"
      fill_in 'user_zipcode', :with => "zipcode"
      fill_in 'user_password', :with => "allison"
      fill_in 'user_password_confirmation', :with => "allison"
      click_button "Create"
      expect(page).to have_content "Welcome"
    end
    it "can't create account with unmatched passwords" do
      visit "/users/new"
      fill_in 'user_username', :with => "allison"
      fill_in 'user_email', :with => "allison@example.com"
      fill_in 'user_city', :with => "San Francisco"
      fill_in 'user_zipcode', :with => "zipcode"
      fill_in 'user_password', :with => "allison"
      fill_in 'user_password_confirmation', :with => "notallison"
      click_button "Create"
      expect(page).to have_content "Form is invalid"
    end
  end

  context "homepage" do
    it "can login" do
      User.create(username: "allison", email: "allison@example.com", city: "San Francisco", zipcode: "94127", password: "allison")
      visit root_path
      fill_in "username", :with => "allison"
      fill_in "password", :with => "allison"
      click_button "Login"
      expect(page).to have_content "Welcome"
    end
  end
end