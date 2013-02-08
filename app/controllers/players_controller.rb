class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(params[:player])

    if @player.save
      sign_in(@player)
      flash[:success] = "You have successfully created your account!"
      redirect_to @player
    else
      render 'new'
    end
  end

  def show
    @player = Player.find(params[:id])
  end

end
