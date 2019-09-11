class MentionSerializer < ActiveModel::Serializer
  attributes :id, :username

  def username
    object.user.username
  end

  has_one :tweet
  has_one :user
end
