class GameOrganizer < ActiveRecord::Base
  attr_accessible :player_id, :game_id

  validates_presence_of :player_id, :game_id

  belongs_to :user, primary_key: :player_id, foreign_key: :user_id
  belongs_to :game
end