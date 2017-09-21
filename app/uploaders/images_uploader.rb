class ImagesUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

include CarrierWave::MiniMagick
  include Piet::CarrierWaveExtension
  
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
