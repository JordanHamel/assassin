class Game < ActiveRecord::Base
  attr_accessible :organizer_id, :rules

  validates :rules, :presence => :true, :length => { :maximum => 5000 }
  validates :organizer_id, :presence => :true
end
