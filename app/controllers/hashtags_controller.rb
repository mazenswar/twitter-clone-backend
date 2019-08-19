class HashtagsController < ApplicationController
    def index
        render json: Hashtag.all
    end

    def show
        render json: Hashtag.find(params[:id])
    end
end
