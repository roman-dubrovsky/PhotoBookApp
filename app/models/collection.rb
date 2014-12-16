class Collection < ActiveRecord::Base
  belongs_to :user

  has_many :slide_shows, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :votes, as: :content, dependent: :destroy

  def elements
    res = self.slide_shows + self.albums
    res.sort{ |x,y| y.created_at <=> x.created_at }  
  end
end
