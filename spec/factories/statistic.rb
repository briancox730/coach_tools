FactoryGirl.define do
  factory :statistic do
    performance 15
    comment "that one hurt"

    user
    wod
    workout
  end
end
