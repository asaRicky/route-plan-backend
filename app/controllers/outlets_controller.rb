class OutletsController < ApplicationController
    before_action :set_outlet, only: [:show, :update, :destroy]
  
    # GET /outlets
    def index
      @outlets = Outlet.all
      render json: @outlets
    end
  
    # GET /outlets/:id
    def show
      render json: @outlet
    end
  
    # POST /outlets
    def create
      @outlet = Outlet.new(outlet_params)
  
      if @outlet.save
        render json: @outlet, status: :created
      else
        render json: @outlet.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /outlets/:id
    def update
      if @outlet.update(outlet_params)
        render json: @outlet
      else
        render json: @outlet.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /outlets/:id
    def destroy
      @outlet.destroy
      head :no_content
    end
  
    private
  
    def set_outlet
      @outlet = Outlet.find(params[:id])
    end
  
    def outlet_params
      params.require(:outlet).permit(:name, :address)
    end
  
end
