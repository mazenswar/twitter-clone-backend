class RetweetSerializer < ActiveModel::Serializer
  attributes :id, :rt, :user_id, :username, :tweet


  def username
    object.user.username
  end

  def tweet
    TweetSerializer.new(object.tweet)
  end
  
end


  # def tweet
  #   return {
  #     id: object.tweet.id,
  #     content: object.tweet.content,
  #     username: object.tweet.user.username,
  #     retweets: object.tweet.retweets.length,
  #     likes: object.tweet.likes.length,
  #   }
  # end