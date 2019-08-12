class RetweetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :tweet, :user, :rt

  attribute :tweet do |obj|
    obj.tweet.serialized
  end

  attribute :user do |obj|
    obj.user.serialized
  end


end
