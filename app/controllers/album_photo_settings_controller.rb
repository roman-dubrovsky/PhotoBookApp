class AlbumPhotoSettingsController < ApplicationController
  def show
    album_photo_setting = AlbumPhotoSetting.find params[:id]
    @photo = album_photo_setting.photo
    @album = album_photo_setting.album
    items = @album.album_photo_settings.map{|p| p.id}
    @num = items.index(params[:id].to_i)
    @next = AlbumPhotoSetting.find(items[@num + 1] || items[0])
    @pred = AlbumPhotoSetting.find(items[@num - 1])
    @count = items.count
  end
end