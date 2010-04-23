class AddTitleToEmail < ActiveRecord::Migration
  def self.up
      add_column :emails, :title, :string  
  end

  def self.down
      remove_column :emails, :title
  end
end
