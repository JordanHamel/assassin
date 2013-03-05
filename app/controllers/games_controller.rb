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
    game_user_id_objs = PlayerGame.select(:user_id).joins(:user).where("game_id = ?", game.id)
    game_users = []

    game_user_id_objs.each do |game_user_id_obj|
      #need to convert from active record object to id
      game_users << User.find(game_user_id_obj.user_id)
    end

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