class CreateFoodFlavors < ActiveRecord::Migration
  def change
    create_table :food_flavors do |t|
    	t.string :name
      t.timestamps
    end
  end
end
