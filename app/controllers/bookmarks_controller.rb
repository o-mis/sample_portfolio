class BookmarksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :index]

  def create
    @micropost = Micropost.find(params[:micropost_id])
    unless @micropost.bookmarked?(current_user)
      @micropost.bookmark(current_user)
      respond_to do |format|
        format.html { redirect_to request.referer || root_path }
        format.js
      end
    end
  end

  def destroy
    @micropost = Bookmark.find(params[:id]).micropost
    if @micropost.bookmarked?(current_user)
      @micropost.unbookmark(current_user)
      respond_to do |format|
        format.html { redirect_to request.referer || root_path }
        format.js
      end
    end
  end

  def index
    @bookmarks = current_user.bookmarked_posts
  end
end
