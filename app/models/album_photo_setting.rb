class AlbumPhotoSetting < ActiveRecord::Base
  belongs_to :album
  belongs_to :photo

  has_many :comments, :as => :commentable
end
