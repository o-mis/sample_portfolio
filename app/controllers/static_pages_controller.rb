class StaticPagesController < ApplicationController
  def home
    @feed = current_user.feed.includes(:user, :likes, :liked_users, :taggings, :tags).page(params[:page]).per(25) if user_signed_in?
    @popular = Micropost.unscoped.joins(:likes).group(:micropost_id).order(Arel.sql('count(likes.user_id) desc')).page(params[:page]).per(25)
    @popular = @popular.includes(:user, :liked_users, :taggings, :tags)
    @latest = Micropost.includes(:user, :likes, :liked_users, :taggings, :tags).page(params[:page]).per(35)
    @like = Like.new
    @bookmark = Bookmark.new
    @micropost = Micropost.new
  end
end
