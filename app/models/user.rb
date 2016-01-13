class User < ActiveRecord::Base
  has_secure_password

  validates :user, presence: true
  validates :email, format: /@/

  has_many :pictures
  has_many :reviews
  validates_associated :reviews
  validates_associated :pictures
end
