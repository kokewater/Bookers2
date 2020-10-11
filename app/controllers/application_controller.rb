class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  protected

#名前でsign_in、メールと名前でsign_up
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  
#ログイン後マイページに飛ぶ
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
end