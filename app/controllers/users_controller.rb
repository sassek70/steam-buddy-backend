class UsersController < ApplicationController
  
  def index
    render json: User.all
  end
  
  def create
    user = User.create!(user_params)
    # user_params = user_params
    render json: user, status: :created
    puts user_params
  end

  def delete_all_users
    user = User.all.destroy
    head :ok
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head :ok
  end

  def email
  end

  private

  def user_params
    params.permit(:id, :username, :user_email)
  end
end
