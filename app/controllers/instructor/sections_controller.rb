class Instructor::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:new, :create]
  before_action :require_authorized_for_current_section, only: [:update, :destroy]


  def new
    @course = Course.find(params[:course_id])
    @section = Section.new
  end

  def create 
    @course = Course.find(params[:course_id])
    @section = @course.sections.create(section_params)
    redirect_to instructor_course_path(@course)
  end

  def update
    current_section.update_attributes(section_params)
    render plain: 'updated!'
  end

  def destroy
    current_section.destroy
    redirect_to instructor_course_path(current_course)
  end



  private

  def require_authorized_for_current_section
    if current_section.course.user != current_user
      render plain: 'Unauthorized', status: :unauthorized
    end
  end

  def require_authorized_for_current_course
    if current_course.user != current_user
      render plain: 'Unauthorized', status: :unauthorized
    end    
  end


  def current_section
    @current_section ||= Section.find(params[:id])
  end

  helper_method :current_section
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end  

  def section_params
    params.require(:section).permit(:title,:content)
  end

  def section_params
    params.require(:section).permit(:title, :content, :row_order_position)
  end

end
