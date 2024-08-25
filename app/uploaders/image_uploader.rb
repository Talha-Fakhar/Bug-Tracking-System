# app/uploaders/image_uploader.rb
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose storage type
  storage :file

  # Define default URL
  def default_url(*args)
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Specify allowed formats
  def extension_whitelist
    %w(gif png)
  end

  # Add any version definitions or custom processing here
  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :medium do
    process resize_to_fit: [200, 200]
  end
end
