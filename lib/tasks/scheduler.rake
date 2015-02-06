desc "This task is called by the Heroku scheduler add-on"
task get_last_wod: :environment do
  require 'open-uri'
  name = Time.now.strftime("%y%m%d")
  program = Program.find_by(name: "Invictus Competition")
  if Wod.find_by(name: name, program_id: program.id).nil?
    begin
      url_date = Time.now.strftime("%B-%-d-%Y").downcase
      wod = Nokogiri::HTML(open("http://www.crossfitinvictus.com/wod/#{url_date}-competition/"))
      new_wod_entry = wod.css('.entry')[0].text.to_s
      new_wod = Wod.create(name: name, description: new_wod_entry, program_id: program.id)
      type_id = WorkoutType.find_by(name: 'weight').id
      name = %w{ a b c d e }
      new_wod.description.split(/[A-Z]\./)[1..-1].each_with_index do |p, i|
        Workout.create(description: p, workout_type_id: type_id, wod_id: new_wod.id, name: name[i])
      end
    rescue
    end
  end
end

task get_last_wod_catalyst: :environment do
  require 'open-uri'
  catalyst = Program.find_by(name: 'Catalyst Athletics')
  name_tomorrow = (DateTime.now + 1).strftime("%y%m%d")
  if Wod.find_by(name: name_tomorrow, program_id: catalyst.id).nil?
    begin
      pieces = []
      file = open("http://www.catalystathletics.com/olympic-weightlifting-workouts/tomorrow.php")
      json = Nokogiri::HTML(file).xpath('//li').each {|w| pieces << w.text}
      if pieces != []
        wod = Wod.create(name: name_tomorrow, description: pieces.to_json, program_id: catalyst.id)
        type_id = WorkoutType.find_by(name: 'weight').id
        name = %w{ a b c d e }
        pieces.each_with_index do |p, i|
          movement_name = /^(.*?)\ - /.match(p)[1]
          movement = Movement.find_by(name: movement_name)
          if movement.present?
            movement_id = movement.id
          else
            movement_id = Movement.create(name: movement_name).id
          end
          Workout.create(description: p, workout_type_id: type_id, wod_id: wod.id, name: name[i], movement_id: movement_id)
        end
      end
    rescue
    end
  end
end


task add_body_weight_ratio: :environment do
  @statistics = Statistic.all
  @statistics.each do |s|
    weight = s.user.personal_record.body_weight
    ratio = weight.zero? ? 0 : s.performance.to_f / weight.to_f
    s.update_attributes(body_weight_ratio: ratio)
  end
end
