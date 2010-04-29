# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100429151622) do

  create_table "contacts", :force => true do |t|
    t.integer  "readed",     :limit => 1,                :null => false
    t.string   "email"
    t.integer  "group_id"
    t.integer  "published",               :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.string   "link"
    t.text     "html"
    t.integer  "published",          :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bgcolor"
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_senders", :id => false, :force => true do |t|
    t.integer  "group_id"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.string   "title"
    t.integer  "sender_id"
    t.integer  "just_read"
    t.datetime "date_start"
    t.datetime "date_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "senders", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "email_id"
    t.string   "subject"
  end

  create_table "sents", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "sent"
    t.integer  "readed"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "email"
    t.integer  "port"
    t.string   "smtp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "senha"
    t.integer  "permissao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
