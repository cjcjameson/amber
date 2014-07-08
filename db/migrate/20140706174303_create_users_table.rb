class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :city 
      t.string :password_digest, null: false
      t.string :zipcode, null: false
    end
  end
end
