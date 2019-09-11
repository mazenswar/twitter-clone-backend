class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fullname, :email, :tweets, :followers, :followees, :mentions

  def mentions
    Mention.all.select {|mn| mn.user.id == object.id}
  end
end
