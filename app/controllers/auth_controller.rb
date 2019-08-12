class AuthController < ApplicationController


    def create
        user = User.find_by(username: user_params[:username])
        if user && user.authenticate(user_params[:password])
            serialized_user = UserSerializer.new(user)
            render json: {user: serialized_user, token: encode_token(user)}
        end
    end

    def persist
        if token
            render json: UserSerializer.new(current_user)
        end
    end

    private

    def user_params
        params.permit(:username, :password)
    end
end