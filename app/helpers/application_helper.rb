module ApplicationHelper
  def current_target_name(target_id)
    User.where(:id => target_id).first.name
  end
end
