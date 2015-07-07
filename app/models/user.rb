
class User < ActiveRecord::Base
  before_create do
    self.password = Digest::SHA2.hexdigest(self.password)
  end
end
