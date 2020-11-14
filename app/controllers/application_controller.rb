class ApplicationController < ActionController::Base
  protected

  def logged_in_user
    redirect_to root_path, alert: 'ログインすると多くの機能が使えます' unless user_signed_in?
  end

  def find_post
    @micropost = Micropost.find(params[:micropost_id])
  end

  def find_chef
    @chef = Chef.find(params[:chef_id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
