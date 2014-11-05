class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :album_photo_settings
  has_many :album, through: :album_photo_settings

  mount_uploader :file, PhotoUploader
end
