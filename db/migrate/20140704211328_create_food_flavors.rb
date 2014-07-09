class CreateFoodFlavors < ActiveRecord::Migration
  def change
    create_table :food_flavors do |t|
    	t.string :name, null: false
      t.timestamps
    end
  end
end
