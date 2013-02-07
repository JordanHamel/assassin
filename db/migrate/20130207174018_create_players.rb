class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :organizer
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
