# app/controllers/student/courses/comments_controller.rb
class Student::Courses::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course
  before_action :set_comment, only: [ :edit, :update, :destroy ]
  before_action :authorize_comment!, only: [ :edit, :update, :destroy ]

  def create
    @comment = @course.comments.build(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to student_course_path(@course), notice: "Comment added."
    else
      redirect_to student_course_path(@course), alert: "Failed to add comment."
    end
  end


def edit
  respond_to do |format|
    format.js
  end
end

  def update
    if @comment.update(comment_params)
      redirect_to student_course_path(@course), notice: "Comment updated."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to student_course_path(@course), notice: "Comment deleted."
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_comment
    @comment = @course.comments.find(params[:id])
  end

  def authorize_comment!
    unless @comment.author == current_user
      redirect_to student_course_path(@course), alert: "Not authorized."
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
