FactoryGirl.define do
  factory :personal_record do
    back_squat 200
    front_squat 200
    overhead_squat 200
    clean 150
    snatch 150
    power_clean 100
    power_snatch 100

    user
  end
end
