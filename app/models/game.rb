class Game < ActiveRecord::Base
  attr_accessible :organizer_id, :rules, :name, :start_time, :end_time

  validates :rules, :presence => :true, :length => { :maximum => 5000 }
  validates :organizer_id, :presence => :true
  validates :name, :presence => :true, :length => { :maximum => 50 }
  validates :start_time, :presence => :true #time isn't before right now
  validates :sign_up_code, :presence => :true
end
