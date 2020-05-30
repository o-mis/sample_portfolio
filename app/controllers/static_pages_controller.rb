class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.create
  end

  # private
  # def micropost_params
  #   params.require(:micropost).permit(:content, :user_id)
  # end
end
