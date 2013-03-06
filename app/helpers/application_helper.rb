module ApplicationHelper
  def current_target_name(target_id)
    User.where(:id => target_id).first.name
  end

  def destroy_current_targets(game)
    #if game gets destroyed, so must the current player targets
    #get objects of users in game
    game_user_id_objs = PlayerGame.select(:user_id).joins(:user).where("game_id = ?", game.id)
    game_users = []

    game_user_id_objs.each do |game_user_id_obj|
      #convert from active record object to id
      #set current target to nil
      user = User.find(game_user_id_obj.user_id).current_target = nil
      user.save!
    end
  end
end
