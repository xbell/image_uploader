class Picture < ActiveRecord::Base
  mount_uploader :url, ImageFileUploader
end
