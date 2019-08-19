class UsersController < ApplicationController

    def index 
        users = User.all
        render json: users
    end

    def show
        # render json: User.find(params[:id]), include: [:followers, :followees, tweets: {include: [:user, :likes]}]
          user = User.find(params[:id])
          render json: user

    end

    def create
        user = User.create(user_params)
        if user.valid?
            user = user
            render json: {user: user, token: encode_token(user)}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
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
