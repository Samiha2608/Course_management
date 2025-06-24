class Admin::TagsController < ApplicationController
  before_action :set_tag, only: [ :update, :destroy ]

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to new_admin_tag_path, notice: "Tag was successfully created."
    else
      # Render the same template that contains your form
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy
    redirect_to new_admin_tag_path, notice: "Tag was successfully deleted."
  end

  def update
    if @tag.update(tag_params)
      redirect_to new_admin_tag_path, notice: "Tag was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
