class Admin::CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
  @course = Course.find(params[:id])
  @comment = Comment.new
  end


  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admin_courses_path, notice: "Course was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to admin_courses_path, notice: "Course was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to admin_courses_path, notice: "Course was successfully deleted."
  end
  private
  def course_params
  params.require(:course).permit(:course_name, :course_hour, :price, :description, tag_ids: [])
  end
end
