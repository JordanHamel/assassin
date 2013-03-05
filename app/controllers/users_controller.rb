class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def kill_target
    user = User.find(params[:id])
    target = User.find(user.current_target)

    temp_target = target.current_target

    target.current_target = nil
    user.current_target = temp_target

    if user.save && target.save
      flash[:notice] = "You have successfully killed your target."
      redirect_to user
    else
      flash[:alert] = "You were unable to kill your target. Try again?"
      render 'new'
    end
  end
end
