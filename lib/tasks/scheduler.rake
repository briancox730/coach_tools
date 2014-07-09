desc "This task is called by the Heroku scheduler add-on"
task get_last_wod: :environment do
  require 'open-uri'
  name = Time.now.strftime("%y%m%d")
  wod = Nokogiri::HTML(open("http://www.crossfitinvictus.com/wod/#{Time.now.strftime("%B-%-d-%Y").downcase}-competition/"))
  new_wod = wod.css('.entry')[0].text.to_s
  program = Program.find_by(name: "Invictus Competition")
  if Wod.find_by(name: name).nil?
    Wod.create(name: name, description: new_wod, program_id: program.id)
  end
end
