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
      redirect_to game
    else
      render 'new'
    end
  end

  def destroy
    @player_game = PlayerGame.find_by_game_id_and_user_id(params[:id], current_user.id)
    game = 

    if @player_game.destroy
      reassign_target
      flash[:notice] = "You've successfully left the game."
      end
        redirect_to current_user
    else
      flash[:notice] = "Well, that didn't work! Care to try again?"
      redirect_to current_user
    end
  end

  def destroy_by_ajax_request
    @player_game = PlayerGame.find_by_user_id_and_game_id(params[:player_id], params[:game_id])
    p @player_game
    @player_game.destroy
    render :nothing => true
  end
end
