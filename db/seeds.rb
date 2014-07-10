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
         {first_name: "Beth", last_name: "R", email: "bethr@example.com", password: "password", password_confirmation: "password"}]

workout_types.each do |type|
  WorkoutType.create(type)
end

programs.each do |program|
  Program.create(program)
end

for i in 0..35
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
