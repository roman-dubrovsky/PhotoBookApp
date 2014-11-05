class AlbumPhotoSetting < ActiveRecord::Base
  belongs_to :album
  belongs_to :photo
end
