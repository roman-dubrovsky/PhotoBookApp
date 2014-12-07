FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "12345678"
  end

  factory :new_user, class: User do
    email "test2@test.com"
    password "12345678"
  end
end