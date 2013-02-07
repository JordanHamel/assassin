class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :organizer_id
      t.text :rules

      t.timestamps
    end
  end
end
