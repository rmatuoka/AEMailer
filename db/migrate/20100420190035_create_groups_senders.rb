class CreateGroupsSenders < ActiveRecord::Migration
  def self.up
    create_table :groups_senders, :id => false do |t|
        t.integer :group_id
        t.integer :sender_id 
        t.timestamps
    end
  end

  def self.down
    drop_table :groups_senders
  end
end
