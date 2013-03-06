class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def kill_target
    user = User.find(params[:id])
    target = User.find(user.current_target)

    #what game are we in?
    game = user.games.last

    temp_target = target.current_target

    #target was killed, is out of game
    target.current_target = nil
    #user inherits target's target
    user.current_target = temp_target

    if user.save && target.save
      if game_won?(game)
        flash[:notice] = "Congrats, you won the game!"
      else
        flash[:notice] = "You have successfully killed your target."
      end
      redirect_to user
    else
      flash[:alert] = "You were unable to kill your target. Try again?"
      render 'new'
    end
  end
end
