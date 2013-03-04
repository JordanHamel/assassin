class AddRememberTokenToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :remember_token, :string
  end
end
