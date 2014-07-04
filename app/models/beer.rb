class Beer < ActiveRecord::Base
  attr_accessible :name, :description, :abv, :isOrganic, :status, :available, :category, :style, :icon_url


end