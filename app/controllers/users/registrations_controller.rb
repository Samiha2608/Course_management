# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :phone_no, :address ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :phone_no, :address ])
  end

  # Override the sign_up method to redirect based on user type
  def after_sign_up_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path
    else
      student_root_path
    end
  end
end
