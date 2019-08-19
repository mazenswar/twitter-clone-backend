class TweetTagSerializer < ActiveModel::Serializer
  attributes :id
  has_one :hashtag
  has_one :tweet
end
