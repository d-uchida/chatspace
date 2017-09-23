class ImageUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg)
  end

  include CarrierWave::MiniMagick
  process resize_to_limit: [400, 200]
end

