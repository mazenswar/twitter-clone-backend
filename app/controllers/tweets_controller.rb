class TweetsController < ApplicationController
    def index
        tweets = Tweet.all
        render json: tweets
    end

    def show
        render json: Tweet.find(params[:id])
    end

    def create
        byebug
        tweet = Tweet.create(content: tweet_params[:content], user: current_user)
        hashtags = tweet_params[:content].split(' ').select {|t| t.include?('#')}
        hashtags.map do |h| 
            hs = Hashtag.create(title: h)
            TweetTag.create(tweet: tweet, hashtag: hs)
        end
        render json: tweet
    end

    def user_tweets 
        render json: current_user.all_tweets
    end

    def show_user_tweets
        user = User.find(params[:id])
        render json: user.all_tweets
    end

    def timeline
        render json: current_user.timeline
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
