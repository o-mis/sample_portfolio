class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:search, :show, :create, :edit, :destroy]
  before_action :has_micropost, only: :destroy

  def index
    if params[:tag_name]
      @microposts = Micropost.tagged_with("#{params[:tag_name]}").page(params[:page]).per(6)
    else
      @microposts = Micropost.page(params[:page]).per(6)
    end
  end

  def search
    @q = Micropost.ransack(params[:q])
    @microposts = @q.result(distinct: true).page(params[:page]).per(6)
  end

  def show
    @micropost = Micropost.find(params[:id])
    @like = Like.new
    @bookmark = Bookmark.new
    @comments = @micropost.comments.page(params[:page]).per(6)
    @comment = @micropost.comments.build
  end

  def new
    @micropost = current_user.microposts.build if user_signed_in?
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to root_path, notice: '投稿が完了しました'
    else
      @feed = []
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
    @micropost.destroy
    redirect_to root_path, notice: '投稿を削除しました'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_micropost
  #   @micropost = Micropost.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.

  def micropost_params
    params.require(:micropost).permit(:content, :arrived_at, :budget, :address, :image, :tag_list)
  end

  def has_micropost
    @micropost = current_user.microposts.find_by!(params[:id])
    redirect_to microposts_path if @micropost.nil?
  end
end
