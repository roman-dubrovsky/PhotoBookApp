require 'rails_helper'

describe Photo do
  describe 'validation' do
    before(:all) do
      @user = FactoryGirl.build(:user)
    end

    it "photo exist?" do
      @photo = Photo.new(user: @user)
      expect(@photo).not_to be_valid
    end
  end
end