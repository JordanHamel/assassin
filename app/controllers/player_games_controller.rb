class PlayerGamesController < ApplicationController

  def new
    @player_game = PlayerGame.new
  end

  def create
    player_game = PlayerGame.new
    player_game.player_id = current_player.id
    game = Game.find_by_sign_up_code(params[:player_game][:game_code])
    params[:player_game][:game_code] = game.id

    if player_game.save!
      flash[:success] = "May the odds be ever in your favor."
      redirect_to game_path(game.id)
    else
      flash.now = "Well, that didn't work. Care to try again?"
      render 'new'
    end
  end

  def destroy
  end
end