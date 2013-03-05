class AddTargetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_target, :integer
  end
end
