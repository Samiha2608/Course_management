class Student::CoursesController < ApplicationController
  def index
    @courses = current_user.courses
  end

  def show
    @course = current_user.courses.find_by(id: params[:id])
    unless @course
      redirect_to student_courses_path, alert: "Course not found."
    end
  end
end
