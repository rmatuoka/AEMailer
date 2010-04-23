class AddNameToEmails < ActiveRecord::Migration
  def self.up
      add_column :emails, :name, :string
  end

  def self.down
      remove_column :emails, :name
  end
end
