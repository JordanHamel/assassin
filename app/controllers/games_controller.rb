class GamesController < ApplicationController

  include GameHelper

  def new
    @game = current_player.organized_games.build
  end

  def create
    @game = current_player.organized_games.build(params[:game])
    @game.sign_up_code = create_sign_up_code

    if @game.save
      flash[:success] = "Your game has been created!"
      redirect_to @game
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

end