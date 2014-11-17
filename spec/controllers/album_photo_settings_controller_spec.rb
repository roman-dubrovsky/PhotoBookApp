require 'rails_helper'

describe AlbumPhotoSettingsController do
  before(:all) do
    @user = User.find_by_email("roma2107@tut.by")
    @photo = AlbumPhotoSetting.first
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