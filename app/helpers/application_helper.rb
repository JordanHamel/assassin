module ApplicationHelper
  def current_target_name(target_id)
    User.where(:id => target_id).first.name
  end

  def destroy_current_targets(game)
    Game.find(game.id).players.each do |player|
      player.current_target = nil
      player.save!
    end
  end

  def game_won?(game)
    alive_players_count = 0

    game.players.each do |player|
      next if player.current_target == nil
      alive_players_count += 1
    end

    return true if alive_players_count == 1
    false
  end
end
