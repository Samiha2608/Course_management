# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  protected

  def build_resource(sign_up_params = {})
  sign_up_params[:type] = "Student"
  super(sign_up_params)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :phone_no, :address ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :phone_no, :address ])
  end

  # Override the sign_up method to redirect based on user type
  def after_sign_up_path_for(resource)
    if resource.is_a?(Admin)
      admin_dashboards_dashboard_path
    else
      student_dashboards_dashboards_path
    end
  end
end
