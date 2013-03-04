class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string

    remove_column :users, :email
    remove_column :users, :encrypted_password
  end
end
