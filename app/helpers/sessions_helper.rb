module SessionsHelper

  def sign_in(player)
    cookies.permanent[:remember_token] = player.remember_token
    self.current_player = player
  end

  def signed_in?
    !current_player.nil?
  end

  def current_player=(player)
    @current_player = player
  end

  def current_player
    @current_player ||= Player.find_by_remember_token(cookies[:remember_token])
  end

  def current_player?(player)
    player == current_player
  end

  def signed_in_player
    unless signed_in?
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def sign_out
    current_player = nil
    cookies.delete(:remember_token)
  end

end