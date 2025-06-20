class Admin::StudentsController < ApplicationController
  before_action :set_student, only: [ :show ]
  def index
    @students = User.where(type: nil) # Assuming only admins have `type: 'Admin'`
  end

  def show
  end

  private
  def set_student
    @student = User.find(params[:id])
    redirect_to admin_students_path unless @student && !@student.is_a?(Admin)
  end
end
