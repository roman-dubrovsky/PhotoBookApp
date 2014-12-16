class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection
  belongs_to :top, class_name: "AlbumPhotoSetting"

  has_many :album_photo_settings, dependent: :destroy
  has_many :photos, through: :album_photo_settings
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :votes, as: :content, dependent: :destroy

  validates :collection, :user, :title, presence: true
end
