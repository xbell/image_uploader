class Picture < ActiveRecord::Base
  mount_uploader :url, ImageFileUploader

  validates :name, presence: true
  validates :url, presence: true
end
