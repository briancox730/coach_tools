FactoryGirl.define do
  factory :statistic do
    sequence(:email) { |n| "email#{n}@example.com" }
    password "password123"

    workout
    user
  end
end
