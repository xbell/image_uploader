class User < ActiveRecord::Base
  has_secure_password

  validates :user, presence: true
  validates :email, format: /@/
end
