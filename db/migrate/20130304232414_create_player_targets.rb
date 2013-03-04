class CreatePlayerTargets < ActiveRecord::Migration
  def change
    create_table :player_targets do |t|
      t.integer :attacker_id
      t.integer :target_id
      t.integer :game_id

      t.timestamps
    end
  end
end
