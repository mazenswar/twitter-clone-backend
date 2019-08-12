class TweetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :username, :likes, :retweets, :user_id, :created_at
 

  # attribute :user do |obj|
  #   obj.user.serialized
  # end

  attribute :username do |obj|
    obj.user.username
  end

  attribute :fullname do |obj|
    obj.user.fullname
  end



end
