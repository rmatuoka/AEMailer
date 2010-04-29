class CreateSents < ActiveRecord::Migration
  def self.up
    create_table :sents do |t|
      t.integer :contact_id
      t.integer :sent
      t.integer :readed
      t.integer :sender_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sents
  end

end
