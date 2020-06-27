class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :has_micropost, only: :destroy

  def index
    @microposts = Micropost.page(params[:page]).per(6)
  end

  def show
    @micropost = Micropost.find(params[:id])
    @like = Like.new
  end

  def search; end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.create!(micropost_params)

    if @micropost.save
      redirect_to users_show_path, notice: '投稿が完了しました'
    else
      render :new
    end
  end

  def update
    if @micropost.update!(micropost_params)
      redirect_to @micropost, notice: '投稿が編集されました'
      render :show, status: :ok, location: @micropost
    else
      render :edit
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_path, notice: '投稿を削除しました'
  end

  private

  # TODO: ログインユーザーのみアクセス可能にする
  # TODO マイクロポストのアクセス制御

  # Use callbacks to share common setup or constraints between actions.
  # def set_micropost
  #   @micropost = Micropost.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.

  def micropost_params
    params.require(:micropost).permit(:content, :arrived_at, :budget, :restaurant, :image)
  end

  def has_micropost
    @micropost = current_user.microposts.find_by!(params[:id])
    redirect_to microposts_path if @micropost.nil?
  end
end
