class CreateBeerStyleTable < ActiveRecord::Migration
  def up
  	create_table :beer_styles do |bs|
  		bs.string :name
  		bs.timestamps
  	end
  end

  def down
  	drop_table :beer_styles
  end
end
