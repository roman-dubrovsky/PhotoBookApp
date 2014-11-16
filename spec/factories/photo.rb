FactoryGirl.define do
  factory :photo do
    file File.open(File.join(Rails.root, "spec","fixtures", "files", "apple.png"))
  end
end