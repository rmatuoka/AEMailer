class CreateSenders < ActiveRecord::Migration
  def self.up
    create_table :senders do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :senders
  end
end
