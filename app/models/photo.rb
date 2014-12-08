class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :album_photo_settings, dependent: :destroy
  has_many :albums, through: :album_photo_settings

  has_many :photo_slide_shows, dependent: :destroy
  has_many :slide_shows, through: :photo_slide_shows 

  mount_uploader :file, PhotoUploader

  validates  :file, presence: true
end
