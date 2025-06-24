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
  def unregister_from_specific_course
    @student = User.find(params[:id])
    # course_enrollment = CourseEnrollment.find_by(student: @student, course_id: params[:course_id])
    course_enrollment = CourseEnrollment.course_unregister(@student, params[:course_id])

    if course_enrollment
      course_enrollment.destroy
      flash[:notice] = "Student successfully unregistered from the course."
    else
      flash[:alert] = "Student is not enrolled in this course."
    end

    redirect_to admin_student_path(@student)
  end

  def enroll
  @student = User.find(params[:id])

  if params[:course_ids].present?
    unique_course_enrollment
    existing_enrollments = CourseEnrollment.existing_enrollments(@student, params[:course_ids])
    # existing_enrollments = CourseEnrollment.where(student: @student, course_id: params[:course_ids])
    if existing_enrollments.exists?
      flash[:alert] = "Student is already enrolled in one or more of the selected courses."
      redirect_to admin_student_path(@student) and return
    end
    params[:course_ids].each do |course_id|
      CourseEnrollment.create(student: @student, course_id: course_id)
    end
    flash[:notice] = "Student successfully enrolled in selected courses."
  else
    flash[:alert] = "No courses selected."
  end

  redirect_to admin_student_path(@student)
  end


  private
  def set_student
    @student = User.find(params[:id])
    redirect_to admin_students_path unless @student && !@student.is_a?(Admin)
  end

  def unique_course_enrollment
    if params[:course_ids].present?
      selected_courses = params[:course_ids].uniq
      if selected_courses.size != params[:course_ids].size
        flash[:alert] = "You cannot enroll a student in the same course multiple times."
        redirect_to admin_students_path
      end
    end
  end
end
