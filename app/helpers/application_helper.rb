module ApplicationHelper
  def current_user?(user)
    return false unless user == current_user

    true
  end
end
