class Album < ActiveRecord::Base
  belongs_to :user

  has_many :album_photo_settings
  has_many :photos, through: :album_photo_settings
end
