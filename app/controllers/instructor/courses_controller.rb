class Instructor::CoursesController < ApplicationController
  before_action :authenticate_user!

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.create(course_params)

    if @course.valid?
      redirect_to instructor_course_path(@course)
    else
      redirect_to new_instructor_course_path, alert: "Invalid Input!"
      
      
    end
  end

  def show
    @course = Course.find(params[:id])

  end

  def edit 
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update_attributes(course_params)
    redirect_to instructor_course_path(@course)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to user_path(current_user)
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :category)
  end

end
