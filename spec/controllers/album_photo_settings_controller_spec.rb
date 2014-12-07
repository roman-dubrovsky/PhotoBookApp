require 'rails_helper'

describe AlbumPhotoSettingsController do
  before(:all) do
    @user = FactoryGirl.create(:user)
    @album = FactoryGirl.create(:album)
    @photo_obj = Photo.new(user: @user)
    @photo_obj.save(validate: false)
    @photo = AlbumPhotoSetting.create(photo: @photo_obj, album: @album)
  end

  after(:all) do
    @user.destroy
    @album.destroy
    @photo_obj.destroy
    @photo.destroy
  end

  describe "without autorization" do
    it "GET :show" do
      get :show, id: @photo.id
      expect(response).not_to be_success
    end
  end

  describe 'GET #show' do
    before(:each) do
      sign_in @user
    end

    it "responds successully with HTTP code 200" do
      get :show, id: @photo.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end