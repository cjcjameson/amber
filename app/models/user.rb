class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :email, :city, :zipcode, :password, :password_confirmation
  validates_uniqueness_of :username, :email
  validates_presence_of :username, :email, :zipcode, :password
  validates :email, format:  { with: /\A.+@.+\..{2,}\z/, message: "only valid emails"}
  validates :username, length: { within: 2..20, too_long: "20 characters is the maximum allowed"}
  validates :password, length: { within: 4..20, too_long: "20 characters is the maximum allowed", too_short: "must have at least 4 characters"}
  validates :zipcode, length: { is: 5, message: "must be integers"}
  validates :zipcode, numericality: { only_integer: true, message: "must be 5 characters long" }
end