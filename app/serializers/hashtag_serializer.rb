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
        hashtags: tweet.hashtags,
        mentions: mentions(tweet.mentions)
      }
    end
  end

  def mentions arr
      arr.map do |mention|
      {
        id: mention.id,
        username: mention.user.username,
        user_id: mention.user.id,
        read: mention.read,
        tweet: mention.tweet
      }
    end
  end
  # :id, :content, :retweets, :likes, :username, :created_at, :user_id, :hashtags
  
end
