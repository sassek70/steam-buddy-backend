class UserController < ApplicationController
  
  def index
    render json: User.all
  end
  
  def username
  end

  def email
  end
end
