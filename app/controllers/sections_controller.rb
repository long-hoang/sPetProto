class SectionsController < ApplicationController
  before_action :authenticate_user!

  
  def show
    @section = Section.find(params[:id])
  end

  def edit
    @section = Section.find(params[:id])
    @course = @section.course

  end


  def update
    @section = Section.find(params[:id])
    @section.update_attributes(section_params)
    redirect_to instructor_course_path(@section.course.id)
  end

  private 

  def section_params
    params.require(:section).permit(:title, :content, :row_order_position)
  end


end
