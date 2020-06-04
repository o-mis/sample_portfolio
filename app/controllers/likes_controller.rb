class LikesController < ApplicationController

  def create
    @like = current_user.likes.create!(micropost_id: params[:micropost_id])
    redirect_to microposts_path
  end

  def destroy
    @like = Like.find_by(micropost_id: params[:micropost_id], user_id: current_user.id
    @like.destroy
    redirect_to microposts_path
  end
end
