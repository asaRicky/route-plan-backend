class CheckInsController < ApplicationController
    before_action :set_check_in, only: [:show, :update, :destroy]
  
    # GET /check_ins
    def index
      @check_ins = CheckIn.all
      render json: @check_ins
    end
  
    # GET /check_ins/:id
    def show
      render json: @check_in
    end
  
    # POST /check_ins
    def create
      @check_in = CheckIn.new(check_in_params)
  
      if @check_in.save
        render json: @check_in, status: :created
      else
        render json: @check_in.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /check_ins/:id
    def update
      if @check_in.update(check_in_params)
        render json: @check_in
      else
        render json: @check_in.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /check_ins/:id
    def destroy
      @check_in.destroy
      head :no_content
    end
  
    private
  
    def set_check_in
      @check_in = CheckIn.find(params[:id])
    end
  
    def check_in_params
      params.require(:check_in).permit(:user_id, :outlet_id, :check_in_timestamp)
    end
  end
  