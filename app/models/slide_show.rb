class SlideShow < ActiveRecord::Base
  belongs_to :user

  has_many :photo_slide_shows, dependent: :destroy
  has_many :photos, through: :photo_slide_shows
  has_many :comments, :as => :commentable 
end
