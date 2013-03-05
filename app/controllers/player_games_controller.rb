class PlayerGamesController < ApplicationController

  before_filter :authenticate_user!

  def new
    @player_game = PlayerGame.new
  end

  def create
    game = Game.find_by_sign_up_code(params[:player_game][:game_code])
    @player_game = PlayerGame.new
    @player_game.game_id = game.id
    @player_game.user_id = current_user.id

    if @player_game.save
      flash[:notice] = "May the odds be ever in your favor."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @player_game = PlayerGame.find_by_game_id(params[:id])

    if @player_game.destroy
      flash[:notice] = "You've successfully left the game."
      redirect_to current_user
    else
      redirect_to current_user
    end
  end
end
