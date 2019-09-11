class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets
  has_many :likes, dependent: :destroy
  has_many :tweet_tags, dependent: :destroy
  has_many :hashtags, through: :tweet_tags
  has_many :mentions

  def username
    self.user.username
  end

end
