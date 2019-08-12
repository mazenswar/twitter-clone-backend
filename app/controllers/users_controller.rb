class UsersController < ApplicationController

    def index 
        users = User.all
        render json: UserSerializer.new(users).serialized_json
    end

    def show
        # render json: User.find(params[:id]), include: [:followers, :followees, tweets: {include: [:user, :likes]}]
          user = User.find(params[:id])
          render json: UserSerializer.new(user).serialized_json

    end

    def create
        user = User.create(user_params)
        if user.valid?
            user = UserSerializer.new(user).serialized_json
            render json: {user: user, token: encode_token(user)}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        user = UserSerializer.new(user).serialized_json
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end


    
    private

    def user_params
        params.permit(:username, :first_name, :last_name, :email, :password)
    end

end
