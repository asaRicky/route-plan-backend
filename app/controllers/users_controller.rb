class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    # GET /users
    def index
      @users = User.all
    end
  
    # GET /users/:id
    def show
      # The @user instance variable has been set by the before_action :set_user
    end
  
    # GET /users/new
    def new
      @user = User.new
    end
  
    # POST /users
    def create
      @user = User.new(user_params)
  
      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    # GET /users/:id/edit
    def edit
      # The @user instance variable has been set by the before_action :set_user
    end
  
    # PATCH/PUT /users/:id
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /users/:id
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully deleted.'
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :role)
    end
  end  
end
