class AuthController < ApplicationController


    def create
        user = User.find_by(username: user_params[:username])
        if user && user.authenticate(user_params[:password])
            render json: {user: user, token: encode_token(user)}
        end
    end

    def persist
        if token
            render json: current_user, include: [:followers, :followees], except: [:password_digest]
        end
    end

    private

    def user_params
        params.permit(:username, :password)
    end
end