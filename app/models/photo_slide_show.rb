class PhotoSlideShow < ActiveRecord::Base
  belongs_to :photo
  belongs_to :slide_show
end
