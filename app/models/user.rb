require 'bcrypt'
class User < ActiveRecord::Base
  #
  # def authenticate password
  #   super.authenticate(Digest::SHA2.hexdigest(password))
  # end
  has_secure_password

end
