# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :show do
    resize_to_fill(800,600)
  end

  version :preview do
    resize_to_fill(300,200)
  end
  
end
