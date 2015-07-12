class UsersController < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!, only: [:onboard]

  def onboard
    if current_user.onboarded
      render root_path
    else
      render 'onboard'
    end
  end

  protected
  # def after_sign_up_path_for resource
  #
  # end
  # def after_sign_in_path_for(resource)
  #   # if resource.onboarded
  #   #   root_path
  #   # else
  #     '/users/onboard'
  #   # end
  # end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
