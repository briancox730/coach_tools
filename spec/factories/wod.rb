FactoryGirl.define do
  factory :wod do
    sequence(:name) { |n| Time.now.strftime("%y%m#{n}")}
    description "A.
                Every minute, on the minute, for 6 minutes:
                Full + Quarter Front Squat
                Increase load from last Monday’s session by 5-8% and use that load for all 6 minutes.
                B.
                Every two minutes, for 12 minutes (6 sets):
                Hang Snatch (mid-thigh) + Snatch @ 80-85% of 1-RM Snatch
                C.
                Every 2 minutes, for 10 minutes (5 sets):
                Back Squat x 5 reps @ same load you used last Monday
                D.
                Three rounds for time of:
                20 Overhead Walking Lunges (95/65 lbs)
                15 Pull-Ups
                OPTIONAL Additional Conditioning Session
                If you have the ability to perform two sessions in one day, and you identify yourself as someone who is stronger than they are well-conditioned, add in this optional work. Preferably this work would be performed early in the day, at least 3-4 hours prior to today’s primary work.
                Five sets of:
                Row 1500 Meters @ 80% of your 500m pace
                Rest 4 minutes"

    program
  end
end
