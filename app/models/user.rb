class User < ActiveRecord::Base
      validates_confirmation_of :senha
      validates_presence_of :senha, :email
      validates_uniqueness_of :email
end
