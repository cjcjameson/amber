class CreateBeersTable < ActiveRecord::Migration
  def up
    create_table :beers do |t|
      t.string :name, :abv, :isOrganic, :status, :available, :category, :style
      t.text :icon_url
      t.text :description
      t.timestamps
    end
  end

  def down
  end
end
