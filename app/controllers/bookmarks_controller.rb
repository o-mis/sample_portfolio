class BookmarksController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy index]
  before_action :find_post, only: :create

  def create
    @micropost.bookmark(current_user) unless @micropost.bookmarked?(current_user)
    respond_to do |format|
      format.html { redirect_to request.referer || root_path }
      format.js
    end
  end

  def destroy
    @micropost = Bookmark.find(params[:id]).micropost
    @micropost.unbookmark(current_user) if @micropost.bookmarked?(current_user)
    respond_to do |format|
      format.html { redirect_to request.referer || root_path }
      format.js
    end
  end

  def index
    @bookmarks = current_user.bookmarked_posts
  end
end
