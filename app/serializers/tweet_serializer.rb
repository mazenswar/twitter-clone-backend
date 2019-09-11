class TweetSerializer < ActiveModel::Serializer
  attributes :id, :content, :retweets, :likes, :username, :created_at, :user_id, :hashtags, :fullname
  has_many :mentions
  def fullname
    object.user.first_name + " " + object.user.last_name
  end
  def username
    object.user.username
  end
  def user_id
    object.user.id
  end

  def mentions
      object.mentions.map do |mention|
      {
        id: mention.id,
        username: mention.user.username,
        user_id: mention.user.id,
        read: mention.read,
        tweet: mention.tweet
      }
    end
  end

end
