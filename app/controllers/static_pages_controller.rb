class StaticPagesController < ApplicationController
  def home
    @micropost = Micropost.new
  end

  # private
  # def micropost_params
  #   params.require(:micropost).permit(:content, :user_id)
  # end
end
