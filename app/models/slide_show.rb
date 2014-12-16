class SlideShow < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection
  belongs_to :top, class_name: "PhotoSlideShow"

  has_many :photo_slide_shows, dependent: :destroy
  has_many :photos, through: :photo_slide_shows
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :votes, as: :content, dependent: :destroy

  validates :collection, :user, :title, presence: true
end
