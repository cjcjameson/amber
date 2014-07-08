class CreateBeerGenreTable < ActiveRecord::Migration
  def up
  	create_table :beer_genres do |bg|
  		bg.string :name, null: false
  		bg.timestamps
  	end
  end

  def down
  	drop_table :beer_genres
  end
end
