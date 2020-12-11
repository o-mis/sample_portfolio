class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def logged_in_user
    redirect_to sign_in_path, alert: 'ログインすると全ての機能が使えます' unless user_signed_in?
  end

  def find_post
    @micropost = Micropost.find(params[:micropost_id])
  end

  def find_chef
    @chef = Chef.find(params[:chef_id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email])
    devise_parameter_sanitizer.permit(:edit, keys: %i[name email avatar])
    # devise_parameter_sanitizer.permit(:update, keys: %i[name email avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email avatar])
  end
end
