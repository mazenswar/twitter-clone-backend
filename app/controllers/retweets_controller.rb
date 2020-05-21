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
            retweet = Retweet.create(rt: true, user_id: current_user.id, tweet_id: retweet_params[:tweet_id])
            render json: retweet
    end

    def destroy
        rt = Retweet.find_by(tweet_id: retweet_params[:tweet_id])
        rt.destroy_all
        render json: {success: 'retweet deleted successfully'}
    end

    private

    def retweet_params
        params.permit(:tweet_id)
    end
end
