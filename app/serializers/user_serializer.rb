class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :fullname, :first_name, :last_name, :followers, :followees
  

 
  attribute :fullname do |obj|
    obj.first_name + " " + obj.last_name
  end



end
