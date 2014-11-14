require 'rails_helper'

describe HomeController do
  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  after(:all) do
    @user.destroy
  end

  describe "without autorization" do
    it "GET :index" do
      get :index
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

    it "check root page" do
      expect(get: "/").to route_to('home#index')
    end
  end
end