class SessionController < ApplicationController
    
    def create
        @user = User.find_by(username: params[:username])
        if @user&.authenticate(params[:password])
            render json: {user: @user}, status: :created
        else
            render json: {error: "Invalid Username or Password"}, status: :unauthorized
        end
    end
end
