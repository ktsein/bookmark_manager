require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, Text

end

def password=(password)
  self.password = BCrypt::Password.create(password)
end
