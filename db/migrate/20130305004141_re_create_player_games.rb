class ReCreatePlayerGames < ActiveRecord::Migration
  def change
    create_table :player_games do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamp
    end
  end
end
