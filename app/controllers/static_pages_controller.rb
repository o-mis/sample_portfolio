class StaticPagesController < ApplicationController
  def home
    @feed = current_user.feed.page(params[:page]).per(8) if user_signed_in?
    @popular = Micropost.unscoped.joins(:likes).group(:micropost_id).order(Arel.sql('count(likes.user_id) desc')).page(params[:page]).per(8)
    @latest = Micropost.page(params[:page]).per(8)
    @like = Like.new
    @bookmark = Bookmark.new
    @micropost = Micropost.new
    # @tags = Micropost.tag_counts_on(:tags).order('count DESC')
  end
end
