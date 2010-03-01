class CreateOverviews < ActiveRecord::Migration
  def self.up
    create_table :overviews do |t|
      t.string :title
      t.text :description
      t.string :locale

      t.timestamps
    end
  end

  def self.down
    drop_table :overviews
  end
end
