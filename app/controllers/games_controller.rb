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

    @player_game = @game.player_games.build
    @player_game.user_id = current_user.id

    # transaction = Game.transaction do
    #   if @game.save
    #     @player_game = PlayerGame.new
    #     @player_game.game_id = @game.id
    #     @player_game.user_id = current_user.id
    #     if @player_game.save
    #       return true
    #     end
    #   end
    #   false
    # end

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

  def destroy
  end

  def generate_user_targets
    game = Game.find(params[:id])
    users_arr = []
    #User.joins(:player_games)
    game_users = User.all#where("games.last.id = ?", game.id)

    game_users.each do |game_user|
      users_arr << game_user
    end

    users_arr.shuffle!

    users_arr.each_with_index do |user, i|
      if i == users_arr.length - 1
        user.current_target = users_arr[0].id
        user.save!
      else
        user.current_target = users_arr[i+1].id
        user.save!
      end
    end

    redirect_to root_url
  end

end