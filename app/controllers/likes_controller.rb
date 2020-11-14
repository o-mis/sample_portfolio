class LikesController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :find_post, only: :create

  def create
    @micropost.like(current_user) unless @micropost.liked?(current_user)
    respond_to do |format|
      format.html { redirect_to request.referer || root_url }
      format.js
    end
  end

  def destroy
    @micropost = Like.find(params[:id]).micropost
    @micropost.unlike(current_user) if @micropost.liked?(current_user)
    respond_to do |format|
      format.html { redirect_to request.referer || root_path }
      format.js
    end
  end
end
