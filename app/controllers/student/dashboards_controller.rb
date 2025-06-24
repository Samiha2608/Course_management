class Student::DashboardsController < ApplicationController
  before_action :ensure_student

  def dashboards
  end

  private

  def ensure_student
    redirect_to admin_dashboards_dashboard_path if current_user.is_a?(Admin)
  end
end
