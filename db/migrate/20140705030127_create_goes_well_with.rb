class CreateGoesWellWith < ActiveRecord::Migration
  def change
    create_table :goes_well_with do |t|
    	t.belongs_to :beer_genre, :food_flavor
    	t.integer :intensity
      t.timestamps
    end
  end
end
