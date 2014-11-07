class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :album_photo_settings
  has_many :albums, through: :album_photo_settings

  mount_uploader :file, PhotoUploader

  validates  :file, presence: true
end
