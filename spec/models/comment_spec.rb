require 'rails_helper'

RSpec.describe Comment, :type => :model do
  before(:all) do
    @user = FactoryGirl.create(:user)
    @album = FactoryGirl.create(:album, user: @user)
  end

  after(:all) do
    @user.destroy
    @album.destroy
  end

  describe 'validation' do
    it 'body presence' do
      comment = @album.comments.new(user: @user)
      expect(comment).not_to be_valid
    end
  end
end
