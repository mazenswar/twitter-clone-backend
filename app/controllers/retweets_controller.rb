class RetweetsController < ApplicationController

    def index
        render json: Retweet.all
    end
    
    def show
        #### just to see data
        retweet = Retweet.find(params[:id])
        render json: retweet
    end
    
    def create
        is_retweeted = Retweet.all.find_by(user_id: current_user.id, tweet_id: retweet_params[:tweet_id])

        if is_retweeted
            tweet = is_retweeted.tweet
            retweet_id = is_retweeted.id
            is_retweeted.delete
            tweet = TweetSerializer.new(tweet)
            render json: {tweet: tweet, retweet_id: retweet_id}
        else
            retweet = Retweet.create(rt: true, user_id: current_user.id, tweet_id: retweet_params[:tweet_id])
            render json: retweet
        end
    end

    private

    def retweet_params
        params.permit(:tweet_id)
    end
end
