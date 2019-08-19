class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fullname, :email, :tweets, :followers, :followees
end
