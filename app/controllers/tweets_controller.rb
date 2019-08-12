class TweetsController < ApplicationController
    def index
        tweets = Tweet.all[0..10]
        render json: TweetSerializer.new(tweets)
    end

    def show
        render json: TweetSerializer.new(Tweet.find(params[:id]))
    end

    def create
        tweet = Tweet.create(content: tweet_params[:content], user: current_user)
        render json: TweetSerializer.new(tweet)
    end

    def user_tweets
        render json: TweetSerializer.new(current_user.tweets) 
    end

    def show_user_tweets
        user = User.find(params[:id])
        render json: TweetSerializer.new(user.tweets)
    end

    def timeline
        render json: TweetSerializer.new(current_user.timeline) 
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
