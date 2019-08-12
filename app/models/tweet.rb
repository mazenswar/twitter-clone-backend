class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets
  has_many :likes, dependent: :destroy

  def serialized
    TweetSerializer.new(self)
  end
end
