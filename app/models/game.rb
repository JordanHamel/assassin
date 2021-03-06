class Game < ActiveRecord::Base
  attr_accessible :organizer_id, :rules, :name, :start_time, :current, :time_zone

  has_one :game_organizer, dependent: :destroy
  has_one :organizer, through: :game_organizer, source: :user

  has_many :player_games, inverse_of: :game, dependent: :destroy
  has_many :players, through: :player_games, source: :user

  validates :rules, presence: true, length: { :maximum => 5000 }
  validates :organizer_id, presence: :true
  validates :name, presence: true, length: { :maximum => 50 }
  validates :start_time, presence: true
  validate :validate_start_time
  validates :sign_up_code, presence: true
  validates :time_zone, presence: true

  private
    def validate_start_time
      #game must be at least 2 days in the future
      if start_time.utc <= DateTime.current.utc + 2.days
        p start_time.utc
        p DateTime.current.utc
        errors.add(:game, "must start at least 2 days in the future.")
      end
    end
end
