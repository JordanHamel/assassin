class GamesController < ApplicationController

  def new
    @game = Game.new
    @current_player = current_player
  end

  def create
    @game = Game.new(params[:game])

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