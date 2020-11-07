class MarksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @chef = Chef.find(params[:chef_id])
    unless @chef.marked?(current_user)
      @chef.mark(current_user)
      respond_to do |format|
        format.html { redirect_to request.referer || root_url }
        format.js
      end
    end
  end

  def destroy
    @chef = Mark.find(params[:id]).chef
    if @chef.marked?(current_user)
      @chef.unmark(current_user)
      respond_to do |format|
        format.html { redirect_to request.referer || root_path }
        format.js
      end
    end
  end
end
