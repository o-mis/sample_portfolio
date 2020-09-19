class ApplicationController < ActionController::Base

  protected

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = 'ログインすると多くの機能が使えます'
      redirect_to root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
