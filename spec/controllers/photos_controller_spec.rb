require 'rails_helper'

describe PhotosController do
  before(:all) do
    @user = FactoryGirl.create(:user)
    @photo = Photo.new(user: @user)
    @photo.save(validate: false)
  end

  after(:all) do
    @user.destroy
    @photo.destroy 
  end

  describe "without autorization" do
    it "GET :index" do
      get :index
      expect(response).not_to be_success
    end

    it "GET :show" do
      get :show, id: @photo.id
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

    it "load only users photo" do
      get :index
      expect(assigns(:photos)).to match_array(@user.photos)
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

  describe 'POST #create' do
    before(:each) do
      sign_in @user
      controller.stub(:photo_params).and_return({})
    end

    it "don't create invalid photo" do      
      post :create
      expect(response).not_to be_success
    end

    it "create valid photo" do
      Photo.stub(:valid?).and_return(true)
      post :create
      expect(response).to redirect_to(photos_path)
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      sign_in @user
    end

    it "create valid photo" do
      delete :destroy, :id => Photo.last
      expect(response).to redirect_to(photos_path)
    end
  end
end