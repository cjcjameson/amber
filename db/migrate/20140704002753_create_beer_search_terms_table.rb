class CreateBeerSearchTermsTable < ActiveRecord::Migration
  def up
  	create_table :beer_search_terms do |bst|
  		bst.string :search_term
  		bst.belongs_to :beer_style

  		bst.timestamps
  	end
  end

  def down
  end
end
