class PlansController < ApplicationController
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
    @course.plans.create(plan_params.merge(user: current_user))
    redirect_to course_path(@course)

  end

  private

  def plan_params
    params.require(:plan).permit(:date,:time)
  end


end
