class Game < ActiveRecord::Base
  attr_accessible :organizer_id, :rules, :name, :start_time, :end_time

  has_many :player_games
  has_many :players, :through => :player_games
  belongs_to :organizer, :class_name => "Player", :foreign_key => :organizer_id

  validates :rules, :presence => :true, :length => { :maximum => 5000 }
  validates :organizer_id, :presence => :true
  validates :name, :presence => :true, :length => { :maximum => 50 }
  validates :start_time, :presence => :true
  validate :validate_start_time, :message => "Can't start a game in the past."
  validate :validate_end_time, :message => "End time must be before start time."
  validates :sign_up_code, :presence => :true

  private
    def validate_start_time
      Time.now.utc < start_time.utc
    end

    def validate_end_time
      start_time.utc < end_time.utc
    end
end
