class CheckInsController < ApplicationController
    # Display all check-ins
    def index
      check_ins = CheckIn.all
      render json: check_ins
    end
  
    # Display single check-in
    def show
      check_in = CheckIn.find(params[:id])
      render json: check_in
    end
  
    # Create new check-in
    def create
      check_in = CheckIn.create(check_in_params)
      if check_in.valid?
        render json: check_in, status: :created
      else
        render json: { errors: check_in.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
      
    private
  
    def check_in_params
      params.require(:check_in).permit(:user_id, :outlet_id, :visit_date, :latitude, :longitude)
    end
end
  