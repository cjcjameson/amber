class RemoveUsers < ActiveRecord::Migration
  def up
  	drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :city 
      t.string :password_digest, null: false
      t.string :zipcode, null: false
      t.timestamps
    end
  end
end
