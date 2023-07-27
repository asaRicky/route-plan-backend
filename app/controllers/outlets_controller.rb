class OutletsController < ApplicationController
    # rescue_from ActiveRecord::RecordInvalid, with: :render_validation_errors
    # rescue_from ActiveRecord::RecordNotFound, with: :not_found
    before_action :set_outlet, only: [:show, :update, :destroy]
  
    # GET /api/outlets
    def index
      @outlets = Outlet.all
      render json: @outlets
    end
  
    # GET /api/outlets/:id
    def show
      render json: @outlet
    end
  
    # POST /api/outlets
    def create
      @outlet = Outlet.new(outlet_params)
  
      if @outlet.save
        render json: @outlet, status: :created
      else
        render json: @outlet.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/outlets/:id
    def update
      if @outlet.update(outlet_params)
        render json: @outlet
      else
        render json: @outlet.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/outlets/:id
    def destroy
      @outlet.destroy
      head :no_content
    end
  
    private
  
    def set_outlet
      @outlet = Outlet.find(params[:id])
    end
  
    def outlet_params
      params.require(:outlet).permit(:name, :address, :latitude, :longitude)
    end

    #  # render error for not found
    #  def not_found
    #     render json: { message: 'Outlet not found'}, status: 404
    #   end
  
    #   # render error for invalid parameters / unprocessable entities
    #   def render_validation_errors(invalid)
    #     render json: { error: invalid.record.errors.full_messages }, status: 422
    #   end
  
end
