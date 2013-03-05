class DropPlayerTargets < ActiveRecord::Migration
  def change
    drop_table :player_targets
  end
end
