class StaticPagesController < ApplicationController

  def home
    @micropost = current_user.microposts.create
    @microposts = Micropost.page(params[:page]).per(6)
  end

  # def index
  #   @microposts = Micropost.page(params[:page]).per(6)
  # end

  # private
  # def micropost_params
  #   params.require(:micropost).permit(:content, :user_id)
  # end
end
