class RetweetsController < ApplicationController


    def create
        retweet = Retweet.find_by({ user_id: current_user.id, tweet_id: retweet_params[:tweet_id]})
        if retweet.nil?
            retweet = Retweet.create({ user_id: current_user.id, tweet_id: retweet_params[:tweet_id]})
            render json: retweet.tweet, include: [:user, :likes, :retweets]
        else
            tweet = retweet.tweet
            retweet.destroy
            render json: tweet, include: [:user, :likes, :retweets]
        end
    end

    private
    def retweet_params
        params.permit(:tweet_id)
    end
end
