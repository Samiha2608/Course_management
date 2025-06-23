class Admin::StudentsController < ApplicationController
  before_action :set_student, only: [ :show, :destroy ]
   def index
  @students = Student.all
   end

  def show
  end

  def destroy
    @student.destroy
    redirect_to admin_students_path, notice: "Student was successfully deleted."
  end

  private
  def set_student
    @student = User.find(params[:id])
    redirect_to admin_students_path unless @student && !@student.is_a?(Admin)
  end
end
