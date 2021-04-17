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
        rt = Retweet.find_by(tweet_id: 
        retweet_params[:tweet_id], user_id: current_user.id)
        if !rt
            retweet = Retweet.create(rt: true, user_id: current_user.id, tweet_id: retweet_params[:tweet_id])
            render json: retweet
        else
            rt_id = rt.id
            rt.destroy
            tweet = Tweet.find(retweet_params[:tweet_id])
            render json: {success: 'retweet deleted successfully', tweet: TweetSerializer.new(tweet), rt_id: rt_id}
        end
            
    end


    private

    def retweet_params
        params.permit(:tweet_id)
    end
end
