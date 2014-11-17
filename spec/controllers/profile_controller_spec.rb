require 'rails_helper'

describe ProfileController do
  before(:all) do
    @user = User.find_by_email("roma2107@tut.by")
    @new_user = FactoryGirl.create(:user)
  end

  after(:all) do
    @new_user.destroy
  end

  describe "without autorization" do
    it "GET :show" do
      get :show, id: @new_user.id
      expect(response).not_to be_success
    end
  end

  describe 'GET #show' do
    before(:each) do
      sign_in @user
    end

    it "responds successully with HTTP code 200" do
      get :show, id: @new_user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end