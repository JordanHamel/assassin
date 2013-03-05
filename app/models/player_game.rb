class PlayerGame < ActiveRecord::Base
  attr_accessible :user_id, :game_id

  validates_presence_of :user_id, :game_id

  belongs_to :user
  belongs_to :game
end