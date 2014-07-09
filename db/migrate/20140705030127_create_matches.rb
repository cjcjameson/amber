class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
    	t.belongs_to :beer_genre, null: false
    	t.belongs_to :food_flavor, null: false
    	t.integer :intensity, default: 3
      t.timestamps
    end
  end
end
