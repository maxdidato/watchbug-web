class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :redirect_if_not_onboarded
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected
  def after_sign_in_path_for(resource)
    cookies[:watchbug_id] = resource.watchbug_id || 0
   resource.onboarded? ? super : onboard_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :first_name,:surname,:watchbug_id,:onboarded) }
  end
end
