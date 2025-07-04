class Admin::DashboardsController < ApplicationController
  before_action :ensure_admin

  def dashboard
  end

  private

  def ensure_admin
    redirect_to student_dashboards_dashboards_path unless current_user.is_a?(Admin)
  end
end
