class AddColumnsToGame < ActiveRecord::Migration
  def change
  	add_column :games, :name, :string
  	add_column :games, :start_time, :datetime
  	add_column :games, :end_time, :datetime
  	add_column :games, :sign_up_code, :string
  end
end
