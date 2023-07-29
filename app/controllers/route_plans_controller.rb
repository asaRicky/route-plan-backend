class RoutePlansController < ApplicationController
    # Display all route plans
    def index
      route_plans = RoutePlan.all
      render json: route_plans
    end
  
    # Display single route plan
    def show
      route_plan = RoutePlan.find(params[:id])
      render json: route_plan
    end
  
    # Create new route plan
    def create
      route_plan = RoutePlan.create(route_plan_params)
      if route_plan.valid?
        render json: route_plan, status: :created
      else
        render json: { errors: route_plan.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    
    private
  
    def route_plan_params
      params.require(:route_plan).permit(:user_id, :start_date, :end_date)
    end
  end
  