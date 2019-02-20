class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :name, :icon, :grade)}
    devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:user_id, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end
end
