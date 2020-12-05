class MicropostsController < ApplicationController
  # before_action :logged_in_user, only: %i[create edit destroy]
  # before_action :has_micropost, only: :destroy

  def index
    @microposts = if params[:tag_name]
                    Micropost.tagged_with(params[:tag_name].to_s).includes(:user, :likes, :liked_users, :taggings, :tags).page(params[:page]).per(25)
                  else
                    Micropost.includes(:user, :likes, :liked_users, :taggings, :tags).page(params[:page]).per(25)
                  end
  end

  def search
    @q = Micropost.ransack(params[:q])
    @microposts = @q.result(distinct: true).includes(:user, :likes, :liked_users, :taggings, :tags).page(params[:page]).per(25)
  end

  def show
    @micropost = Micropost.find(params[:id])
    @like = Like.new
    @bookmark = Bookmark.new
    @comments = @micropost.comments.page(params[:page]).per(25)
    @comment = @micropost.comments.build
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to root_path, notice: '投稿が完了しました'
    else
      render :new
    end
  end

  def edit
    @micropost = Micropost.find_by!(params[:id])
  end

  def update
    @micropost = Micropost.find_by!(params[:id])
    if @micropost.update(micropost_params)
      redirect_to @micropost, notice: '投稿が編集されました'
    else
      render :edit
    end
  end

  def destroy
    @micropost = Micropost.find_by!(params[:id])
    @micropost.destroy
    redirect_to root_path
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :arrived_at, :budget, :address, :image, :tag_list)
  end

  # def has_micropost
  #   @micropost = current_user.microposts.find_by!(params[:id])
  #   redirect_to root_path if @micropost.nil?
  # end
end
