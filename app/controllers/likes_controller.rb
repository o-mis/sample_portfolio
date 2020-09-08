class LikesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    unless @micropost.liked?(current_user)
      @micropost.like(current_user)
      respond_to do |format|
        format.html { redirect_to request.referer || root_url }
        format.js
      end
    end
  end

  def destroy
    @micropost = Like.find(params[:id]).micropost
    if @micropost.liked?(current_user)
      @micropost.unlike(current_user)
      respond_to do |format|
        format.html { redirect_to request.referer || root_path }
        format.js
      end
    end
  end
end
