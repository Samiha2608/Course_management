# app/controllers/home_controller.rb
class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # Optional redirect to dashboard if already logged in
    redirect_to after_sign_in_path_for(current_user) if user_signed_in?
  end
end
