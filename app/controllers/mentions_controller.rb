class MentionsController < ApplicationController

    def index
        render json: Mention.all
    end
end
