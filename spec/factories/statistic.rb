FactoryGirl.define do
  factory :statistic do
    performance 15

    user
    wod
    workout
  end
end
