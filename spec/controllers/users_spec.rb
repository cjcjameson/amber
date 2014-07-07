require 'spec_helper'

describe UsersController do
  context "#new" do
    it "renders the page" do
      get :new
      expect(response).to be_ok
    end
  end
end