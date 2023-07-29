class UsersController < ApplicationController
    # Display all users
    def index
        users = User.all
        render json: users
    end

    # Display single user
    def show
        @user = User.find(params[:id])
    end

    # Create new user
    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user_id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        render json: current_user
    end

    def update
        if current_user.update(user_params)
          render json: { status: 'SUCCESS', message: 'User updated successfully', data: @current_user }
        else
          render json: { status: 'ERROR', message: 'Failed to update user', data: @current_user.errors }
        end
    end
    
      def destroy
        if current_user.destroy
          render json: { status: 'SUCCESS', message: 'User deleted successfully', data: @current_user }
        else
          render json: { status: 'ERROR', message: 'Failed to delete user', data: @current_user.errors }
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :role)
    end
        
end
