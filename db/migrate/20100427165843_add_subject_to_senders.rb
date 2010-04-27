class AddSubjectToSenders < ActiveRecord::Migration
  def self.up
    add_column :senders, :subject, :string
  end

  def self.down
    remove_column :senders, :subject
  end
end
