class Picture < ActiveRecord::Base
  mount_uploader :image_file, ImageFileUploader
end
