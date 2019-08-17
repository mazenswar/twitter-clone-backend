class User < ApplicationRecord
    has_secure_password
    
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users

    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users

    has_many :tweets
    has_many :likes

    def serialized
        UserSerializer.new(self)
    end

    def fullname
        self.first_name + " " + self.last_name
    end

    def timeline
        tweets = self.followees.map(&:tweets).flatten + self.tweets
        tweets.sort_by(&:created_at).reverse!
    end

    def all_tweets
        self.tweets + self.retweets
    end


end
