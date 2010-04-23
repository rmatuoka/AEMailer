class AddBgcolorToEmail < ActiveRecord::Migration
  def self.up
    add_column :emails, :bgcolor, :string  
  end

  def self.down
      remove_column :emails, :bgcolor
  end
end
