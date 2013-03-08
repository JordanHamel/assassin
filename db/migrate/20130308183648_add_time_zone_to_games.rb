class AddTimeZoneToGames < ActiveRecord::Migration
  def change
    add_column :games, :time_zone, :string, :default => "UTC"
  end
end
