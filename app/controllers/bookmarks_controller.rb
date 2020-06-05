class BookmarksController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    unless @micropost.bookmarked?(current_user)
      @micropost.bookmark(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_path }
        format.js
      end
    end
  end

  def destroy
    @micropost = Bookmark.find(params[:id]).micropost
    if @micropost.bookmarked?(current_user)
      @micropost.unbookmark(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_path }
        format.js
      end
    end
  end
end
