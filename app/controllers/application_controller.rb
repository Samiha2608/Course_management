# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller_or_redirect?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  def clear_session
    reset_session
    redirect_to root_path, notice: "Session cleared"
  end

  # ✅ Handles root "/" request
  def redirect_after_sign_in
    if user_signed_in?
      if current_user.is_a?(Admin)
        redirect_to admin_root_path
      else
        redirect_to student_root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  private

  def devise_controller_or_redirect?
    devise_controller? || action_name == "redirect_after_sign_in"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :phone_no, :address ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :phone_no, :address ])
  end

  # ✅ Correctly defined outside of any other method
  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_root_path : student_root_path
  end

  def after_sign_up_path_for(resource)
    resource.is_a?(Admin) ? admin_root_path : student_root_path
  end
  class ApplicationController < ActionController::Base
    # After logout, send user to homepage
  end
end
