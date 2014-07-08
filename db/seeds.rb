User.delete_all
Statistic.delete_all
Wod.delete_all
WorkoutType.delete_all
Program.delete_all
PersonalRecord.delete_all

workout_types = [{name: "weight"},
          {name: "time"},
          {name: "complete"},
          {name: "rep"}]

programs = [{name: "Invictus Competition"}]

wods = [{name: "140630", description: "A.
                                      Five sets of:
                                      Full + Quarter Front Squat x 2 reps
                                      Rest 2 minutes
                                      Build over the course of the five sets.
                                      B.
                                      Five sets of:
                                      Halting Snatch Deadlift + Snatch Pull + Snatch @ 80-90% of 1-RM Snatch
                                      Rest as needed
                                      C.
                                      Every 2 minutes, for 10 minutes (5 sets):
                                      Back Squat x 4 reps @ 3-5% more than you used last Monday
                                      D.
                                      Every 3 minutes, for 9 minutes (3 sets):
                                      20 Walking Lunges with KBs (24/16 kg KBs in each hand)
                                      15 GHD Sit-Ups
                                      OPTIONAL Additional Conditioning Session
                                      For 30 minutes:
                                      Run 400 Meters @ 75% of your best 400
                                      Run 400 Meters @ 50% of your best 400
                                      Example…if your best 400m is 60 seconds, you’d run 75% at 80 seconds, and 50% at 120 seconds."},
        {name: "140701", description: "A.
                                      Every minute, on the minute, for 12 minutes:
                                      Minute 1 – Strict Toes to Bar x 8 reps @ 3110
                                      (these should be slow and controlled)
                                      Minute 2 – Handstand Hold x 45 seconds
                                      (freestanding, or working toward it by using a spotter or a wall and slowly trying to find balance points for the 45 seconds)
                                      Minute 3 – Unbroken Double-Unders x 50 reps
                                      B.
                                      Every two minutes, for 16 minutes (8 sets):
                                      Push Press + Power Jerk + Split Jerk
                                      (Pause for 2-3 seconds in the split jerk receiving position before recovering.)
                                      Goal is to use heaviest 2-3 loads from last week for all 8 sets.
                                      C.
                                      Strict Overhead Press
                                      * Set 1 – 5 reps @ 50%
                                      * Set 2 – 5 reps @ 60%
                                      * Set 3 – 5 reps @ 70%
                                      * Sets 4-9 – 3 reps @ 85-90%
                                      * Set 10 – 10 reps @ 55-65%
                                      Rest 90 seconds to 2 minutes between sets.
                                      This is the last week of the volume pressing. Hang in there.
                                      D.
                                      Every 8 minutes, for 24 minutes (3 sets) of:
                                      Row 500 Meters
                                      25/20 Handstand Push-Ups
                                      Run 400 Meters
                                      If possible, perform the handstand push-ups as strict handstand push-ups. If you cannot finish the set within 6 minutes, please reduce the number of reps or distances of the row or run."},
        {name: "140702", description: "A.
                                      Every 2 minutes, for 16 minutes (8 sets):
                                      Halting Clean Deadlift + Hang Clean + Clean
                                      Build over the course of the 8 sets.
                                      Drop the barbell after the hang clean! It’s important that you consider WHY you are doing certain drills. If you see a barbell complex as part of our weightlifting skill session (not for time), then make sure you are putting yourself in perfect positions. Drop the barbell, set yourself properly, then lift. If you see a complex in a timed workout, then by all means practice your touch and go reps.
                                      B.
                                      Every minute, on the minute…
                                      Back Squat
                                      *Set 1 – 40% x 1 rep
                                      *Set 2 – 50% x 1 rep
                                      *Set 3 – 60% x 1 rep
                                      *Set 4 – 70% x 1 rep
                                      *Set 5 – 80% x 1 rep
                                      and then….
                                      Every 2 minutes…
                                      *Set 6 – 85% x 1 rep
                                      *Set 7 – 90% x 1 rep
                                      *Set 8 – 95% x 1 rep
                                      and then…
                                      One set of:
                                      85% Back Squat x Max Reps @ 20X1
                                      (no excessive pause at the top – you get one full breath cycle, exhale, inhale, brace and descend – if you take longer than that your set is over)
                                      C.
                                      Every minute, on the minute, for 12 minutes:
                                      Speed Deadlift x 3 reps @ 75%
                                      D.
                                      Four sets for times of:
                                      Row 1000 Meters
                                      20 Chest-to-Bar Pull-Ups
                                      30 Wall Ball Shots (30/20 lbs)
                                      40 Russian Kettlebell Swings (32/24 kg)
                                      Rest exactly 4 minutes"},
        {name: "140704", description: "A.
                                      Front Squat
                                      *Set 1 – 3 reps @ 70%
                                      *Set 2 – 2 reps @ 80%
                                      *Set 3 – 2 reps @ 85-90%
                                      *Set 4 – 1 rep @ 90-95%
                                      *Set 5 – 1 rep @ 95+%
                                      Rest 2-3 minutes between sets.
                                      B.
                                      Every two minutes, for 16 minutes (8 sets):
                                      Hang Clean + Clean + Front Squat + Jerk
                                      Build to today’s heaviest set.
                                      C.
                                      Every two minutes, for 10 minutes (5 sets):
                                      Front-Racked Alternating Reverse Lunges x 10 reps (5 each leg)
                                      Use the heaviest load you believe you can handle for all five sets. Good starting loads might be 185/125 lbs…and move up from there if you’re handling it well.
                                      D.
                                      Three sets of:
                                      Snatch-Grip Romanian Deadlift x 6 reps @ 3111
                                      Rest as needed
                                      Stationary Dips x 20-30 reps
                                      Rest as needed
                                      OPTIONAL Additional Conditioning Session
                                      Every 10 minutes, for 40 minutes (4 sets):
                                      Run 800 Meters
                                      4/3 Rope Climbs (15′)
                                      AirDyne for Max Calories
                                      (if you don’t have an airdyne, row for calories)"},
        {name: "140705", description: "A.
                                      Complete as many rounds and reps as possible in 8 minutes of:
                                      4 Muscle-Ups
                                      8 Strict Handstand Push-Ups
                                      40 Double-Unders
                                      When the running clock hits 15:00, complete the following…
                                      B.
                                      For time:
                                      Row 1000 Meters
                                      95/65 lb Hang Power Snatch x 40 reps
                                      Toes to Bar x 30 reps
                                      95/65 lb Shoulder to Overhead x 20 reps
                                      When the running clock hits 30 minutes, complete the following…
                                      C.
                                      For time:
                                      Row 1000 Meters
                                      95/65 lb Shoulder to Overhead x 40 reps
                                      Toes to Bar x 30 reps
                                      95/65 lb Hang Power Snatch x 20 reps
                                      D.
                                      10 Minutes of Cool Down on AirDyne or easy running"},
        {name: "140707", description: "A.
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
                                      Rest 4 minutes"},
        {name: "140708", description: "A.
                                      Every minute, on the minute, for 12 mintues:
                                      Minute 1 – Strict Muscle-Up x 1-4 reps
                                      (regress this with feet on the floor, still working strong controlled pull and transition with as little assistance as possible)
                                      Minute 2 – Handstand Walk x 15-20 Meters
                                      Minute 3 – Unbroken Double-Unders x 50 reps
                                      (yep, we practice these every week…they need to be viewed as a rest station for you in a conditioning workout)
                                      B.
                                      Every two minutes, for 16 minutes (8 sets):
                                      Power Jerk + Split Jerk
                                      (Pause for 2-3 seconds in the split jerk receiving position before recovering.)
                                      Rest 2 minutes
                                      Goal is to use heaviest 2-3 loads from last week for all 8 sets. Use blocks if you have them.
                                      C.
                                      Strict Overhead Press
                                      * Set 1 – 5 reps @ 75%
                                      * Set 2 – 5 reps @ 80%
                                      * Set 3 – 4 reps @ 85%
                                      * Set 4 – 3 reps @ 90%
                                      * Set 5 – 2 reps @ 95%
                                      Rest 2 minutes between sets.
                                      D.
                                      Five sets for times of:
                                      Run 400 Meters
                                      5 Ground to Overhead (185/135 lbs)
                                      5 Bar Muscle-Ups
                                      10 Strict Handstand Push-Ups
                                      Rest 2 minutes
                                      If a set is taking you more than 4 minutes, you need to scale it back and keep your time under 4 minutes for each set."}]

users = [{first_name: "Brian", last_name: "C", email: "brianc@example.com", password: "password", password_confirmation: "password"},
         {first_name: "Cam", last_name: "S", email: "cams@example.com", password: "password", password_confirmation: "password"},
         {first_name: "Adam", last_name: "R", email: "adamr@example.com", password: "password", password_confirmation: "password"},
         {first_name: "Beth", last_name: "R", email: "bethr@example.com", password: "password", password_confirmation: "password"}]

workout_types.each do |type|
  WorkoutType.create(type)
end

programs.each do |program|
  Program.create(program)
end

users.each do |user|
  user[:program_id] = Program.all.last.id
  holder = User.create(user)
  newpr = PersonalRecord.find_by(user_id: holder.id)
  newpr.update({back_squat: 390, front_squat: 350, overhead_squat: 270, clean: 305,
                snatch: 252, power_clean: 265, power_snatch: 200, hang_clean: 270,
                hang_snatch: 255, split_jerk: 310, push_jerk: 285, push_press: 265,
                press: 205, dead_lift: 405})
  newpr.save
end

wods.each do |wod|
  wod[:program_id] = Program.all.last.id
  Wod.create(wod)
end
