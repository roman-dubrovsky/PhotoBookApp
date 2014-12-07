require 'rails_helper'

describe AlbumsController do
  before(:all) do
    @user = FactoryGirl.create(:user)
    @album = FactoryGirl.create(:album, user: @user)  
  end

  after(:all) do
    @user.destroy
    @album.destroy
  end

  describe "without autorization" do
    it "GET :index" do
      get :index
      expect(response).not_to be_success
    end

    it "GET :show" do
      get :show, id: @album.id
      expect(response).not_to be_success
    end

    it "GET :new" do
      get :new
      expect(response).not_to be_success
    end

    it "GET :edit" do
      get :edit, id: @album.id
      expect(response).not_to be_success
    end
  end

  describe 'GET #index' do
    before(:each) do
      sign_in @user
    end

    it "responds successully with HTTP code 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    before(:each) do
      sign_in @user
    end

    it "responds successully with HTTP code 200" do
      get :show, id: @album.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    before(:each) do
      sign_in @user
    end

    it "responds successully with HTTP code 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    before(:each) do
      sign_in @user
    end

    it "responds successully with HTTP code 200" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    before(:each) do
      sign_in @user
      controller.stub(:album_params).and_return({})
    end

    it "don't create invalid photo" do      
      post :create
      expect(response).not_to be_success
    end

    it "create valid photo" do
      Album.stub(:valid?).and_return(true)
      post :create
      expect(response).to redirect_to(album_path(Album.last))
    end
  end

  describe 'POST #update' do
    before(:each) do
      sign_in @user
      controller.stub(:album_params).and_return({})
    end

    it "don't create invalid photo" do      
      post :update, id: Album.last
      expect(response).not_to be_success
    end

    it "create valid photo" do
      Album.stub(:valid?).and_return(true)
      post :update, id: Album.last
      expect(response).to redirect_to(album_path(Album.last))
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      sign_in @user
    end

    it "create valid photo" do
      delete :destroy, :id => Album.last
      expect(response).to redirect_to(albums_path)
    end
  end

  describe "photos in album" do
    before(:each) do
      sign_in @user
    end

    before(:each) do
      @new_photo = Photo.new(user: @user)
      @new_photo.save(validate: false)
    end

    after(:each) do
      @new_photo.destroy
    end

    describe "POST :add" do
      it "new photo" do
        post :add, id: @album.id, photo: @new_photo.id
        expect(response).to redirect_to(edit_album_path(@album))
      end
    end

    describe "DELETE :delete" do
      it "last photo" do
        post :add, id: @album.id, photo: @new_photo.id
        photo = @album.photos.last
        delete :delete, id: @album.id, photo: photo.id
        expect(response).to redirect_to(edit_album_path(@album))
      end
    end
  end
end