class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
    	t.belongs_to :beer_genre
    	t.belongs_to :food_flavor
    	t.integer :intensity
      t.timestamps
    end
  end
end
