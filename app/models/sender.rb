class Sender < ActiveRecord::Base
    has_and_belongs_to_many :groups
    has_one :email

    validates_presence_of :group_ids, :title, :subject
end
