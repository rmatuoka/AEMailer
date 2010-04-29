class Group < ActiveRecord::Base
    has_and_belongs_to_many :senders
    has_many :contacts
    
    validates_presence_of :name
end
