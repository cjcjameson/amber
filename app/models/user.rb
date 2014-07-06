class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :email, :city, :zipcode, :password, :password_confirmation
  validates_uniqueness_of :username, :email
  validates_presence_of :username, :email, :zipcode, :password
end