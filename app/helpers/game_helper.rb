module GameHelper

  def create_sign_up_code
    rand(100000..999999).to_s
  end

end