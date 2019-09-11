class TweetsController < ApplicationController
    def index
        tweets = Tweet.all
        render json: tweets
    end

    def show
        render json: Tweet.find(params[:id])
    end

    def create
        tweet = Tweet.create(content: tweet_params[:content], user: current_user)
        hashtags = tweet_params[:content].split(' ').select {|t| t.start_with?('#')}
        mentions = tweet_params[:content].split(' ').select {|t| t.start_with?('@')}
        hashtags.map do |h| 
            hs = Hashtag.create(title: h)
            TweetTag.create(tweet: tweet, hashtag: hs)
        end
        mentions.map do |m| 
            username = m.slice(1, m.length)
            user = User.find_by(username: username)
            Mention.create(tweet: tweet, user: user) if user
            byebug
        end

        render json: tweet, include: "**"
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
