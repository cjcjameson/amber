class Beer < ActiveRecord::Base
  attr_accessible :name, :description, :abv, :available, :category, :style, :label_url


end