class ChangeBeerIconColumnName < ActiveRecord::Migration
  def up
  	rename_column :beers, :icon_url, :label_url
  end

  def down
  	rename_column :beers, :label_url, :icon_url
  end
end

