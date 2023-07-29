class MerchandisersController < ApplicationController
    before_action :set_merchandiser, only: [:show, :update, :destroy]
  
    # GET /merchandisers
    def index
      @merchandisers = Merchandiser.all
      render json: @merchandisers
    end
  
    # GET /merchandisers/:id
    def show
      render json: @merchandiser
    end
  
    # POST /merchandisers
    def create
      @merchandiser = Merchandiser.new(merchandiser_params)
  
      if @merchandiser.save
        render json: @merchandiser, status: :created
      else
        render json: @merchandiser.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /merchandisers/:id
    def update
      if @merchandiser.update(merchandiser_params)
        render json: @merchandiser
      else
        render json: @merchandiser.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /merchandisers/:id
    def destroy
      @merchandiser.destroy
      head :no_content
    end
  
    private
  
    def set_merchandiser
      @merchandiser = Merchandiser.find(params[:id])
    end
  
    def merchandiser_params
      params.require(:merchandiser).permit(:name, :contact_number)
    end
  
end
