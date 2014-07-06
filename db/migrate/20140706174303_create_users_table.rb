class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :email, :city, :password_digest, :zipcode
    end
  end
end
