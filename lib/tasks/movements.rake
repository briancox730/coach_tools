desc "This task will populate the movements table"
task populate_movements: :environment do
  movements = [{name: "Back Squat"},
               {name: "Front Squat"},
               {name: "Overhead Squat"},
               {name: "Clean"},
               {name: "Snatch"},
               {name: "Power Clean"},
               {name: "Power Snatch"},
               {name: "Hang Clean"},
               {name: "Hang Snatch"},
               {name: "Split Jerk"},
               {name: "Push Jerk"},
               {name: "Push Press"},
               {name: "Press"},
               {name: "Dead Lift"}]
  movements.each do |m|
    Movement.create(m)
  end
end
