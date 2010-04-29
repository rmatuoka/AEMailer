class Email < ActiveRecord::Base
    validates_presence_of :title

    has_attached_file :image, :styles => { :thumb => "125x125>" },
				:url => "/uploads/:attachment/:id/:basename_:style.:extension",
				:path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension"
end
