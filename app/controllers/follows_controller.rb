class FollowsController < ApplicationController

    def follow
        # byebug
        user_to_follow = User.find(params[:id])
        if user_to_follow && !user_to_follow.followers.include?(current_user)
            user_to_follow.followers << current_user
            render json: user_to_follow
        elsif user_to_follow.followers.include?(current_user)
            user_to_follow.followers = user_to_follow.followers.select {|u| u.id != current_user.id}
            render json: user_to_follow
        else 
            render json: {error: "Can't make it happen"}
        end
    end

    def unfollow
    end
end
