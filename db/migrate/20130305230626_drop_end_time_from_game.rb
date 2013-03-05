class DropEndTimeFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :end_time
  end
end
