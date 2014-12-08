desc "This task is called by the Heroku scheduler add-on"
task get_last_wod: :environment do
  require 'open-uri'
  name = Time.now.strftime("%y%m%d")
  url_date = Time.now.strftime("%B-%-d-%Y").downcase
  wod = Nokogiri::HTML(open("http://www.crossfitinvictus.com/wod/#{url_date}-competition/"))
  new_wod = wod.css('.entry')[0].text.to_s
  program = Program.find_by(name: "Invictus Competition")
  if Wod.find_by(name: name, program_id: program.id).nil?
    Wod.create(name: name, description: new_wod, program_id: program.id)
  end

  # catalyst athletics
  name_tomorrow = (DateTime.now + 1).strftime("%y%m%d")
  pieces = []
  json = Nokogiri::HTML(open("http://www.catalystathletics.com/olympic-weightlifting-workouts/tomorrow.php")).xpath('//li').each {|w| pieces << w.text}
  catalyst = Program.find_by(name: 'Catalyst Athletics')
  if Wod.find_by(name: name_tomorrow, program_id: catalyst.id).nil?
    Wod.create(name: name_tomorrow, description: pieces.to_json, program_id: catalyst.id)
  end
end

