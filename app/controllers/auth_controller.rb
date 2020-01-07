class AuthController < ApplicationController

    def create
        # byebug
        user = User.find_by(username: params[:username])
        is_authenticated = user.authenticate(params[:password])
       
        if is_authenticated
            render json: user
        else 
            render json: {errors: ["wrong username or password"]}, status: 422
        end

    end

end