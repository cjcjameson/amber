class CreateBeersTable < ActiveRecord::Migration
  def up
    create_table :beers do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :abv, :available, :style
      t.text :icon_url
      t.text :description, null: false
      t.timestamps
    end
  end

  def down
  end
end
