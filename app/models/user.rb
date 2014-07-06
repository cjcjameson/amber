class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :email, :city, :zipcode, :password
end