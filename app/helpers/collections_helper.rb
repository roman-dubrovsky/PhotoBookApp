module CollectionsHelper
  def top_picture element
    unless element.top.nil?
      image_tag element.top.photo.file_url(:preview)
    else
      unless element.photos.empty?
        image_tag element.photos.first.file_url(:preview)
      else
        image_tag 'no_top.png'
      end
    end
  end
end
