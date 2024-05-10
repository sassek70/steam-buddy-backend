class UsersController < ApplicationController
  
  def index
    render json: User.all
  end
  
  def create
    user = User.create!(user_params)
    render json: user, status: :created
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
    params.permit(:id, :username, :user_email)
  end
end
