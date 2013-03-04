class GamesController < ApplicationController

  before_filter :authenticate_user!

  include GameHelper

  def new
    @game = current_user.organized_games.build
  end

  def create
    ### fix this!!
    @game = current_user.organized_games.build(params[:game])
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