class RouteVisitsController < ApplicationController
    before_action :set_route_visit, only: [:show, :edit, :update, :destroy]
  
    # GET /route_visits
    def index
      @route_visits = RouteVisit.all
    end
  
    # GET /route_visits/:id
    def show
      # The @route_visit instance variable has been set by the before_action :set_route_visit
    end
  
    # GET /route_visits/new
    def new
      @route_visit = RouteVisit.new
    end
  
    # POST /route_visits
    def create
      @route_visit = RouteVisit.new(route_visit_params)
  
      if @route_visit.save
        redirect_to @route_visit, notice: 'Route visit was successfully created.'
      else
        render :new
      end
    end
  
    # GET /route_visits/:id/edit
    def edit
      # The @route_visit instance variable has been set by the before_action :set_route_visit
    end
  
    # PATCH/PUT /route_visits/:id
    def update
      if @route_visit.update(route_visit_params)
        redirect_to @route_visit, notice: 'Route visit was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /route_visits/:id
    def destroy
      @route_visit.destroy
      redirect_to route_visits_url, notice: 'Route visit was successfully deleted.'
    end
  
    private
  
    def set_route_visit
      @route_visit = RouteVisit.find(params[:id])
    end
  
    def route_visit_params
      params.require(:route_visit).permit(:merchandiser_id, :outlet_id, :visit_date, :latitude, :longitude)
    end
end
