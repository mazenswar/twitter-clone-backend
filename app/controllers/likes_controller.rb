class LikesController < ApplicationController
    
    def create
        like = Like.find_by(tweet_id: like_params[:tweet_id], user_id: current_user.id)
        if like
            like.destroy
            tweet = Tweet.find(like_params[:tweet_id])
            render json:  TweetSerializer.new(tweet)
        else
            like = Like.create(tweet_id: like_params[:tweet_id], user_id: current_user.id)
            render json: TweetSerializer.new(like.tweet)
        end
    end

    def destroy
        tweet = Tweet.find(like_params[:tweet_id])
        like = tweet.likes.find_by(user_id: current_user.id)
        like.destroy
        render json: TweetSerializer.new(tweet)
    end

    private
    def like_params
        params.permit(:tweet_id)
    end
end
