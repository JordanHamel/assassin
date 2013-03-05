class AddCurrentColumnToGame < ActiveRecord::Migration
  def change
    add_column :games, :current, :boolean
  end
end
