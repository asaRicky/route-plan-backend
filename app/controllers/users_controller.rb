class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def index
      #get users
      render json: User.all, status: :ok
  end
  # GET /users/{id}
  def show
      #check if user is present
      user = User.find_by(id:params[:id])
      #return user
      if user
          render json: user, status: :ok
      #throw error
      else
          render json: { error: "User not found" }, status: :not_found
      end
  end
  # POST
  def signup
    # Create a new user with the provided parameters
    user = User.new(user_params)
    # debugger
    if user.save
      # If the user is successfully created, generate a token and render the response
      token = encode_token(user.id, user.email)
      render json: { user: user, token: token }, status: :created
    else
      # If there are validation errors, render the errors
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def create
      #create a new user
      user = User.create(user_params)
      if user.valid?
          save_user(user.id)
          render json:user, status: :created
      else
          render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
      end
  end
  # PUT/PATCH /users/{id}
  def update
      # check whether the task exists
      user = User.find_by(id:params[:id])
      if user
          user.update(user_params)
          # return it
          render json: user, status: :accepted
      else
          # throw a not found error
          render json: {error: "User not found"}, status: :not_found
      end
  end
  # DELETE
  def destroy
      # check whether the task exists
      user = User.find_by(id: user_params[:id])
     #  delete the task
     if user
         user.destroy
         head :no_content
     #  return a not found user
     else
         render json: {error: 'User not found'}, status: not_found
     end
  end
  # AUTHENTICATE A USER
  def login
      # get the user by email
      user = User.find_by(email: user_params[:email])
      # validate whether the password is true
       if user && user.authenticate(user_params[:password])
          save_user(user.id)
          token = encode_token(user.id, user.email)
          render json: { user: user, token: token}, status: :ok
      # return an invalid email or password scheme
      else
          render json: { error: 'Invalid email or password'}, status: :unauthorized
      end
  end
  # logout user
  def logout
      remove_user
      render json: {message: 'Logout successful'}
  end
  # GET ALL EVENTS RELATED TO A USER ID
  def get_all_user_events
  end
   private
  def user_params
      params.permit(:username, :email, :password_digest)
  end
end