require 'rails_helper'

describe Photo do
  describe 'validation' do
    before(:all) do
      @user = FactoryGirl.build(:user)
    end

    it "file dont exist" do
      photo = Photo.new(user: @user)
      expect(photo).not_to be_valid
    end
  end

  describe "uploader" do
    it "try load photo" do
      photo = FactoryGirl.create(:photo, user: @user)
      expect(Photo.find(photo.id)).to eq(photo)
      photo.destroy
    end
  end
end