class DeviseCreateAdmins < ActiveRecord::Migration
  def self.up
    create_table(:admins) do |t|
      t.database_authenticatable :null => false
      t.trackable
      t.lockable
      t.invitable

      t.timestamps
    end
    
    add_index :admins, :invitation_token # for invitable
  end

  def self.down
    drop_table :admins
  end
end
