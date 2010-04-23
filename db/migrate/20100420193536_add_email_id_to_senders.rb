class AddEmailIdToSenders < ActiveRecord::Migration
  def self.up
    add_column :senders, :email_id, :integer
  end

  def self.down
    remove_column :senders, :email_id
  end
end
