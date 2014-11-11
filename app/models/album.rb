class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :top, class_name: "AlbumPhotoSetting"

  has_many :album_photo_settings, dependent: :destroy
  has_many :photos, through: :album_photo_settings
end
