class CreateBeerStylesTable < ActiveRecord::Migration
  def up
  	create_table :beer_styles do |bst|
  		bst.string :name
  		bst.belongs_to :beer_genre

  		bst.timestamps
  	end
  end

  def down
  	drop_table :beer_styles
  end
end
