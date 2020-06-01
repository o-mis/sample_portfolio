class LikesController < ApplicationController
  def index
    @likes = Likes.all
  end

  def create
    @like = current_user.likes.create!(micropost_id: params[:micropost_id])
    if like.save
      redirect_to microposts_path
  end

  def destroy
    @like.destroy
    redirect_to microposts_path
  end
end
