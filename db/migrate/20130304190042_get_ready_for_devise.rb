class GetReadyForDevise < ActiveRecord::Migration
  def change
    drop_table :players
    drop_table :player_games
  end
end
