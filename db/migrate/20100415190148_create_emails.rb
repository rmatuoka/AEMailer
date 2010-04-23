class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :type
      t.string :image
      t.string :link
      t.text :html
      t.integer :published

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
