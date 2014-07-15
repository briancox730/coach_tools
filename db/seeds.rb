require 'open-uri'
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

users = [{first_name: "Brian", last_name: "C", email: "brianc@example.com", password: "password", password_confirmation: "password"},
         {first_name: "Cam", last_name: "S", email: "cams@example.com", password: "password", password_confirmation: "password"},
         {first_name: "Adam", last_name: "R", email: "adamr@example.com", password: "password", password_confirmation: "password"},
         {first_name: "Beth", last_name: "R", email: "bethr@example.com", password: "password", password_confirmation: "password"},
         {first_name: "Nora", last_name: "B", email: "norab@example.com", password: "password", password_confirmation: "password"},
         {first_name: "Ming", last_name: "C", email: "mingc@example.com", password: "password", password_confirmation: "password"}]

prs = [{back_squat: 390, front_squat: 350, overhead_squat: 270, clean: 305, snatch: 252, power_clean: 265, power_snatch: 200,
        hang_clean: 270, hang_snatch: 255, split_jerk: 320, push_jerk: 285, push_press: 265, press: 205, dead_lift: 405},
       {back_squat: 380, front_squat: 340, overhead_squat: 285, clean: 285, snatch: 220, power_clean: 265, power_snatch: 180,
        hang_clean: 265, hang_snatch: 200, split_jerk: 310, push_jerk: 275, push_press: 245, press: 170, dead_lift: 415},
       {back_squat: 460, front_squat: 410, overhead_squat: 270, clean: 335, snatch: 265, power_clean: 305, power_snatch: 225,
        hang_clean: 300, hang_snatch: 250, split_jerk: 340, push_jerk: 290, push_press: 265, press: 200, dead_lift: 565},
       {back_squat: 200, front_squat: 185, overhead_squat: 150, clean: 200, snatch: 160, power_clean: 150, power_snatch: 150,
        hang_clean: 160, hang_snatch: 145, split_jerk: 200, push_jerk: 140, push_press: 120, press: 100, dead_lift: 285},
       {back_squat: 160, front_squat: 160, overhead_squat: 130, clean: 160, snatch: 140, power_clean: 120, power_snatch: 100,
        hang_clean: 140, hang_snatch: 110, split_jerk: 160, push_jerk: 130, push_press: 110, press: 80, dead_lift: 200},
       {back_squat: 240, front_squat: 220, overhead_squat: 185, clean: 210, snatch: 170, power_clean: 180, power_snatch: 160,
        hang_clean: 160, hang_snatch: 120, split_jerk: 200, push_jerk: 180, push_press: 140, press: 120, dead_lift: 300}]

workout_types.each do |type|
  WorkoutType.create(type)
end

programs.each do |program|
  Program.create(program)
end

for i in 0..50
  date = Time.now - (i * 86400)
  name = date.strftime("%y%m%d")
  url = date.strftime("%B-%-d-%Y").downcase
  begin
    wod = Nokogiri::HTML(open("http://www.crossfitinvictus.com/wod/#{url}-competition/"))
    new_wod = wod.css('.entry')[0].text.to_s
    program = Program.find_by(name: "Invictus Competition")
    if Wod.find_by(name: name).nil?
      Wod.create(name: name, description: new_wod, program_id: program.id)
    end
  rescue
  end
end

users.each_with_index do |user,i|
  user[:program_id] = Program.all.last.id
  holder = User.create(user)
  newpr = PersonalRecord.find_by(user_id: holder.id)
  newpr.update({back_squat: 390, front_squat: 350, overhead_squat: 270, clean: 305,
                snatch: 252, power_clean: 265, power_snatch: 200, hang_clean: 270,
                hang_snatch: 255, split_jerk: 310, push_jerk: 285, push_press: 265,
                press: 205, dead_lift: 405})
  newpr.save
end
