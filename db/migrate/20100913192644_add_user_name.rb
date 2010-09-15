class AddUserName < ActiveRecord::Migration
  def self.up
    add_column :users, :user_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_index :users, :user_name, :unique => true

    add_column :admins, :user_name, :string
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string

    add_index :admins, :user_name, :unique => true
  end

  def self.down
    remove_idex :admins, :user_name

    remove_column :admins, :last_name
    remove_column :admins, :first_name
    remove_column :admins, :user_name

    remove_idex :users, :user_name

    remove_column :users, :last_name
    remove_column :users, :first_name
    remove_column :users, :user_name
  end
end
