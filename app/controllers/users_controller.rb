class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[update destroy following followers]
  before_action :set_user, only: %i[show following followers]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.page(params[:page]).per(25)
  end

  def show
    @like = Like.new
    @bookmark = Bookmark.new
    @following = @user.following
    @followers = @user.followers
    @microposts = @user.microposts.page(params[:page]).per(25)
    @chefs = @user.chefs.page(params[:page]).per(25)
  end

  def search
    @q = User.ransack(params[:q])
    @users =
      if params[:q].nil?
        @q.result(distinct: true).page(params[:page]).per(25)
      else
        @q.result(distinct: true).page(params[:page]).per(25)
      end
  end

  def edit; end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'プロフィールを編集しました。'
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = 'プロフィールを編集できませんでした。'
      render :edit
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'ユーザーを削除しました' }
      format.json { head :no_content }
    end
  end

  def following
    # @users = @user.following
    @following = @user.following
    @followers = @user.followers
  end

  def followers
    # @users = @user.followers
    @following = @user.following
    @followers = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
