class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :organizer,
                  :email, :password, :password_confirmation
  has_secure_password
  has_many :games

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :presence => :true, :length => { :maximum => 30 }
  validates :last_name, :presence => :true, :length => { :maximum => 30 }
  validates :email, :presence => :true, :format => { with: VALID_EMAIL_REGEX },
            :uniqueness => { :case_sensitive => :false }
  validates :password, :presence => :true, :length => { :minimum => 5}
  validates :password_confirmation, :presence => true
end
