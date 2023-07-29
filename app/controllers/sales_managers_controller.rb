class SalesManagersController < ApplicationController
    before_action :set_sales_manager, only: [:show, :update, :destroy]
  
    # GET /sales_managers
    def index
      @sales_managers = SalesManager.all
      render json: @sales_managers
    end
  
    # GET /sales_managers/:id
    def show
      render json: @sales_manager
    end
  
    # POST /sales_managers
    def create
      @sales_manager = SalesManager.new(sales_manager_params)
  
      if @sales_manager.save
        render json: @sales_manager, status: :created
      else
        render json: @sales_manager.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /sales_managers/:id
    def update
      if @sales_manager.update(sales_manager_params)
        render json: @sales_manager
      else
        render json: @sales_manager.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /sales_managers/:id
    def destroy
      @sales_manager.destroy
      head :no_content
    end
  
    private
  
    def set_sales_manager
      @sales_manager = SalesManager.find(params[:id])
    end
  
    def sales_manager_params
      params.require(:sales_manager).permit(:name, :contact_number)
    end
  
end
