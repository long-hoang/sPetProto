class PlansController < ApplicationController
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
    @plan = @course.plans.create(plan_params.merge(user: current_user))



    if @plan.valid?
      flash[:notice] = 'Successfully added!'
      redirect_to course_path(@course)
    else
      redirect_to course_path(@course), alert: "Invalid input, try again!"
    end 


  end


  def index
    render json: current_user.plans.all
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :date,:time, :category)
  end


end
