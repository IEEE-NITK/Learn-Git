FactoryGirl.define do
  factory :user do
    name     "user1"
    email    "user1@example.com"
    password "12345678"
    password_confirmation "12345678"
  end
end