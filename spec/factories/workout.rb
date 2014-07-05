FactoryGirl.define do
  factory :workout do
    sequence(:email) { |n| "email#{n}@example.com" }
    password "password123"

    wtype
  end
end
