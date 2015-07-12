class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :redirect_if_not_onboarded
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def redirect_if_not_onboarded
    if current_user and !current_user.onboarded
      redirect_to users_onboard_path
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :first_name,:surname,:watchbug_id,:onboarded) }
  end
end
