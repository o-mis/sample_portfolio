class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user) unless current_user.following.include?(user)
    # redirect_to user
  end

  def destroy
    relationship = Relationship.find_by(id: params[:id])
    if relationship.nil?
      user = User.find(params[:user_id])
    else
      user = relationship.followed
      current_user.unfollow(user)
    end
  end
end
