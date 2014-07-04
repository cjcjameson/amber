class CreateBeersTable < ActiveRecord::Migration
  def create
    create_table :beers do |t|
      t.string :name, :description, :abv, :isOrganic, :status, :available, :category, :style
      t.timestamps
    end
  end
end
