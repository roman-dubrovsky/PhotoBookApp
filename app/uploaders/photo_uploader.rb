# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :show do
    resize_to_fit(800,600)
  end

  version :preview do
    resize_to_fit(400,300)
  end
  
end
