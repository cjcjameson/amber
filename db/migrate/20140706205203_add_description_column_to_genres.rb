class AddDescriptionColumnToGenres < ActiveRecord::Migration
  def change
  	 add_column :beer_genres, :description, :text, null: false
  end
end
