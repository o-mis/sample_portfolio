class StaticPagesController < ApplicationController
  def home
    # @micropost = current_user.microposts.page(params[:page]).per(15)
    # @microposts = Micropost.page(params[:page]).per(15)
    @feed = current_user.feed.page(params[:page]).per(15)
  end

  # private
  # def micropost_params
  #   params.require(:micropost).permit(:content, :user_id)
  # end
end
