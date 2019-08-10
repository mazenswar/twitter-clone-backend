class TweetsController < ApplicationController
    def index
        render json: Tweet.all, include: :user
    end

    def create
        tweet = {content: tweet_params[:content], user: current_user}
        render json: Tweet.create(tweet), include: [:user, :likes]
    end

    def user_tweets
        full_tweets = current_user.tweets
        render json: full_tweets, include: [:user, :likes]
    end

    def show_user_tweets
        user = User.find(params[:id])
        render json: user.tweets, include: [:user, :likes]
    end

    def timeline
        render json: current_user.timeline, include: [:user, :likes]
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
    end


    private

    def tweet_params
        params.require(:tweet).permit(:content)
    end
end
