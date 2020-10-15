class ChefsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :edit, :destroy]

  def index
    @like = Like.new
    @bookmark = Bookmark.new
    @micropost = Micropost.new
    @chef = Chef.new
    @chef = current_user.chefs.page(params[:page]).per(12) if user_signed_in?
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = current_user.chefs.build(chef_params)
    if @chef.save
      redirect_to chefs_path, notice: 'お知らせを投稿しました'
    else
      render :new
    end
  end

  def show
    @chef = Chef.find(params[:id])
    @chefs = @user.chefs.page(params[:page]).per(20)
    @micropost = Micropost.find(params[:id])
  end

  private

  def chef_params
    params.require(:chef).permit(:comment, :address, :image, :tag_list)
  end
end
