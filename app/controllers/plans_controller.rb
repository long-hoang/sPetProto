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


  def edit 
    @plan = current_plan
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update_attributes(plan_params)
    redirect_to user_path(current_user)
  end

  def destroy 
    current_plan.destroy
    redirect_to user_path(current_user)
  end


  def index
   
    render json: current_user.plans.all.order(:time)
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :date,:time, :category)
  end

  def current_plan
    @current_plan ||= Plan.find(params[:id])
  end

  helper_method :current_plan


end
