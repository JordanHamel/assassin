class GamesController < ApplicationController

  before_filter :authenticate_user!

  include GameHelper

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    @game.current = false
    @game.organizer_id = current_user.id
    @game.sign_up_code = create_sign_up_code

    if @game.save
      flash[:success] = "Your game has been created!"
      redirect_to @game
    else
      flash[:error] = "Oops, that didn't work. Try again?"
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

end