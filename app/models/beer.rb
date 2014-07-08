class Beer < ActiveRecord::Base
  attr_accessible :name, :description, :abv, :available, :category, :style, :label_url
	validates_presence_of :name, :description, :category
	validates :name, length: { minimum: 2 }
	validates :category, length: { minimum: 2 }
	validates :description, length: { minimum: 10 }
end