class RoutePlansController < ApplicationController
    before_action :set_route_plan, only: [:show, :update, :destroy]

    # GET /api/route_plans/:id
    def show
      render json: @route_plan
    end
  
    # POST /api/route_plans
    def create
      @route_plan = RoutePlan.new(route_plan_params)
  
      if @route_plan.save
        render json: @route_plan, status: :created
      else
        render json: @route_plan.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/route_plans/:id
    def update
      if @route_plan.update(route_plan_params)
        render json: @route_plan
      else
        render json: @route_plan.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/route_plans/:id
    def destroy
      @route_plan.destroy
      head :no_content
    end
  
    private
  
    def set_route_plan
      @route_plan = RoutePlan.find(params[:id])
    end
  
    def route_plan_params
      params.require(:route_plan).permit(:start_date, :end_date )
    end
  
end
