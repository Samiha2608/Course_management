class Student::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_student!

  def show
    @student = current_user
    @comments = @student.comments.includes(:author)
  end

  private

  def require_student!
    redirect_to root_path, alert: "Not authorized" unless current_user.is_a?(Student)
  end
end
