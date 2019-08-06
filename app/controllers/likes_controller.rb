class LikesController < ApplicationController
    
    def create
        like = Like.create(tweet_id: like_params[:tweet_id], user_id: current_user.id)
        if like.valid?
            render json: like.tweet, include: [:user, :likes, :retweets]
        else
            render json: {error: "You cannot like a tweet more than once"}
        end
    end

    def destroy
        tweet = Tweet.find(like_params[:tweet_id])
        like = tweet.likes.find_by(user_id: current_user.id)
        like.destroy
        render json: tweet, include: [:user, :likes, :retweets]
    end

    private
    def like_params
        params.permit(:tweet_id)
    end
end
