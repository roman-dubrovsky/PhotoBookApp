require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  before(:all) do
    @user = FactoryGirl.create(:user)
    @album = FactoryGirl.create(:album, user: @user)
  end

  after(:all) do
    @user.destroy
    @album.destroy
  end

  describe 'POST #create' do
    before(:each) do
      sign_in @user
      controller.stub(:comment_params).and_return({})
    end

    it 'add comment to album' do
      post :create, commenter_type: 'Album', commenter_id: @album.id
      expect(response).to redirect_to(album_path(@album))
    end

    it 'add comment to user' do
      post :create, commenter_type: 'User', commenter_id: @user.id
      expect(response).to redirect_to(profile_path(@user))
    end
  end
end
