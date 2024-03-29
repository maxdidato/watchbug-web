require 'httparty'
class UsersController < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!, only: [:onboard]


  def onboard
    current_user.onboarded? ? redirect_to(root_path) : render('onboard')
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
