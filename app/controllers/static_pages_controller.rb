class StaticPagesController < ApplicationController
  def home
    @feed = current_user.feed.page(params[:page]).per(6) if user_signed_in?
    @latest = Micropost.page(params[:page]).per(6)
    @like = Like.new
    @bookmark = Bookmark.new
    @micropost = Micropost.new
    # @q = Micropost.ransack(params[:q])
  end
end
