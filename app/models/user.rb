class User < ActiveRecord::Base
  has_many :swits
  has_secure_password
  validates_uniqueness_of :username
end
