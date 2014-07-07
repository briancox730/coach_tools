FactoryGirl.define do
  factory :program do
    sequence(:name) { |n| "Invictus#{n}"}
  end
end
