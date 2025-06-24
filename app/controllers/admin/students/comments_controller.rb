# app/controllers/admin/students/comments_controller.rb
class Admin::Students::CommentsController < ApplicationController
  before_action :set_student
  before_action :set_comment, only: [ :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def create
    @comment = @student.comments.build(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to admin_student_path(@student), notice: "Comment added."
    else
      redirect_to admin_student_path(@student), alert: "Failed to add comment."
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to admin_student_path(@student), notice: "Comment updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to admin_student_path(@student), notice: "Comment deleted."
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def set_comment
    @comment = @student.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authorize_user!
    unless current_user.is_a?(Admin) || @comment.author == current_user
      redirect_to admin_student_path(@student), alert: "Not authorized."
    end
  end
end
