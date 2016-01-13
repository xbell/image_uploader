class Picture < ActiveRecord::Base
  mount_uploader :url, ImageFileUploader

  validates :name, presence: true
  validates :url, presence: true

  has_many :reviews
  validates_associated :reviews
  belongs_to :user
end
