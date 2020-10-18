class ChefsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy]
  before_action :has_chef, only: :destroy

  def index
    @like = Like.new
    @bookmark = Bookmark.new
    @micropost = Micropost.new
    @chef = Chef.new
    @chef = Chef.page(params[:page]).per(20)
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
    # @chefs = @user.chefs.page(params[:page]).per(20)
    @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments.page(params[:page]).per(8)
    @comment = @micropost.comments.build
  end

  def destroy
    @chef.destroy
    redirect_to chefs_path, notice: 'お知らせを削除しました'
  end

  private

  def chef_params
    params.require(:chef).permit(:comment, :address, :image, :tag_list)
  end

  def has_chef
    @chef = current_user.chefs.find_by!(params[:id])
    redirect_to chefs_path if @chef.nil?
  end
end
