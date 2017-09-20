class ImagesUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

include CarrierWave::MiniMagick
  include Piet::CarrierWaveExtension
  
  process quality: 80
  
  # Large size
  process resize_to_limit: [640, 640]
  process :custom_optimize
  
  # Midium size
  version :midium do
    process resize_to_limit: [300, 300]
    process :custom_optimize
  end
  
  # Small size
  version :small do
    process resize_to_limit: [200, 200]
    process :custom_optimize
  end
  
   def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def mimetype
    IO.popen(["file", "--brief", "--mime-type", path], in: :close, err: :close) { |io| io.read.chomp.sub(/image\//, "") }
  end
  
  
  def custom_optimize
    case mimetype
    when "png" then pngquant
    when "jpeg", "gif" then optimize(quality: 90)
  end

end
