class UsersController < ApplicationController

    def index 
        render json: User.all, include: [:followers, :followees, :tweets]
    end

    def show
        render json: User.find(params[:id]), include: [:followers, :followees, tweets: {include: [:user, :likes]}]
    end

    def create
        user = User.create(user_params)
        if user.valid?
            render json: {user: user, token: encode_token(user)}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user, include: [:followers, :followees]
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
