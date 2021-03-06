require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id,        Serial
  property :name,      String
  property :email,     String, required: true, unique: true
  property :password_digest,  Text

  has n, :propertys
  has n, :requests

  def self.check_password(email, password)
    user = first(email: email)
    if (user && BCrypt::Password.new(user.password_digest)) == password
      false
    else
      true
    end
  end
end
