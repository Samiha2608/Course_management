class Admin::Courses::CommentsController < ApplicationController
  before_action :set_course
  before_action :set_comment, only: [ :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]
  def create
    @comment = @course.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to admin_course_path(@course), notice: "Comment was successfully created."
    else
      Rails.logger.error(@comment.errors.full_messages) # <--- Add this
      redirect_to admin_course_path(@course), alert: "Failed to create comment."
    end
  end



  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to admin_course_path(@course), notice: "Comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to admin_course_path(@course), notice: "Comment was successfully deleted."
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end
  def set_comment
    @comment = @course.comments.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:content)
  end
  def authorize_user!
    unless current_user.is_a?(Admin) || @comment.author == current_user
      redirect_to admin_course_path(@course), alert: "You are not authorized to perform this action."
    end
  end
end
