class ImageUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :convert => 'jpeg'

  include CarrierWave::MiniMagick
  process resize_to_limit: [400, 200]
end

