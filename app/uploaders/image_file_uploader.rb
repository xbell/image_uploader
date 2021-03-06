# encoding: utf-8

class ImageFileUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [32, 32]
  end

  version :preview do
    process :resize_to_fit => [256, 256]
  end

  version :square do
    process :resize_to_fill => [256, 256]
  end

  version :big do
    process :resize_to_fit => [800, 500]
  end

  version :gravatar do
    process :resize_to_fit => [8, 8]
  end

end
