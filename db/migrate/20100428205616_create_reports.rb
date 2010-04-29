class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.string :title
      t.integer :sender_id
      t.integer :just_read
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
