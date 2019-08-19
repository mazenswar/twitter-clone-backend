class TweetSerializer < ActiveModel::Serializer
  attributes :id, :content, :retweets, :likes, :username, :created_at, :user_id, :hashtags

  def username
    object.user.username
  end

  def user_id
    object.user.id
  end

end
