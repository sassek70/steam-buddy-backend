class UsersController < ApplicationController
  wrap_parameters format: []
  
  def index
    render json: User.all
  end

  def show
    user = User.find(params[:id])
    render json: user
  end
  
  def create
    user = User.create!(user_params)
    auth_token = JWT.encode({auth_token_id: user.id, username: user.username}, ENV['JWT_TOKEN'])
    render json: {auth_token: auth_token, user: user}, status: :created
  end

  def delete_all_users
    users = User.destroy_all
    render json: {message: "All Test Users deleted successfully"}, status: :ok
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    # head :ok
    render json: {message: "User deleted successfully"}, status: :ok
  end

  def update
    user = User.find(params[:id])
    user.update(user_params) 
    render json: user, status: :ok
  end

  private

  def user_params
    # params.require(:user).permit(:id, :username, :password, :user_email)
    params.permit(:id, :username, :password, :user_email)

  end
end
