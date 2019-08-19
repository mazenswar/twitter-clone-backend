class HashtagSerializer < ActiveModel::Serializer
  attributes :id, :title, :tweets

  def tweets
    object.tweets.map do |tweet|
      {
        id: tweet.id,
        retweets: tweet.retweets,
        likes: tweet.likes,
        content: tweet.content,
        user_id: tweet.user_id,
        username: tweet.username,
        created_at: tweet.created_at,
        hashtags: tweet.hashtags
      }
    end
  end

  # :id, :content, :retweets, :likes, :username, :created_at, :user_id, :hashtags
  
end
