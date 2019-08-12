class RetweetsController < ApplicationController

    def show
        #### just to see data
        retweet = RetweetSerializer.new(Retweet.find(params[:id]))
        render json: retweet
    end
    
    def create
        is_retweeted = Retweet.all.find_by(user_id: current_user.id, tweet_id: retweet_params[:tweet_id])

        if is_retweeted
            tweet = is_retweeted.tweet
            is_retweeted.delete
            render json: TweetSerializer.new(tweet)
        else
            retweet = Retweet.create(rt: true, user_id: current_user.id, tweet_id: retweet_params[:tweet_id])
            render json: RetweetSerializer.new(retweet)
        end
    end

    private

    def retweet_params
        params.permit(:tweet_id)
    end
end
