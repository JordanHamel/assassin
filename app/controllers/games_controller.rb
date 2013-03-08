class GamesController < ApplicationController

  include ApplicationHelper

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

    @player_game = @game.player_games.build
    @player_game.user_id = current_user.id

    if @game.save && @player_game.save
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

  def edit
    if current_user.id == Game.find(params[:id]).organizer_id
      @game = Game.find(params[:id])
    else
      flash[:notice] = "Sorry, you can't see that page!"
      redirect_to Game.find(params[:id])
    end
  end

  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(params[:game])
      flash[:notice] = "Your game has been successfully updated."
      redirect_to @game
    else
      flash[:notice] = "We were unable to update your game. Try again?"
      render 'new'
    end
  end

  def destroy
    game = Game.find(params[:id])

    if destroy_current_targets(game) && game.destroy
      flash[:notice] = "Your game has been successfully deleted."
      redirect_to current_user
    else
      flash[:notice] = "We were unable to delete your game. Please try again."
      render 'new'
    end
  end

  def generate_user_targets
    game = Game.find(params[:id])
    players = game.players.shuffle!

    players.each_with_index do |user, i|
      if i == players.length - 1
        user.current_target = players[0].id
        user.save!
      else
        user.current_target = players[i+1].id
        user.save!
      end
    end

    redirect_to root_url
  end

  def players_index
    @game = Game.find(params[:id])
    @players = @game.players
  end
end