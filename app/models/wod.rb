class Wod < ActiveRecord::Base
  has_many :workouts, dependent: :destroy
  belongs_to :program
  has_many :statistics, through: :workouts

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :program_id

  def self.associated_workouts(wod)
    results = []

    wod.program.workouts.includes(:wod, :movement).limit(25).sort_by(&:created_at).reverse.each do |w|
      name = w.wod.name.to_s + w.name.to_s + ' ' + Date.strptime(w.wod.name, "%y%m%d").strftime('%A')

      if !w.movement.nil?
        name += " " + w.movement.name
      end
      results << [ name, w.id ]
    end

    results
  end

  def self.build_workout_catalyst(url)
    require 'open-uri'
    catalyst = Program.find_by(name: 'Catalyst Athletics')
    name = DateTime.now.strftime("%y%m%d")
    if Wod.find_by(name: name, program_id: catalyst.id).nil?
      pieces = []
      file = open(url)
      json = Nokogiri::HTML(file).css('div.workouts_list_text').text.split("\r\n").each {|s| pieces << s.strip }
      if pieces != []
        pieces.delete_if { |p| /^(.*?)\ - /.match(p).nil? }
        wod = Wod.create(name: name, description: pieces.to_json, program_id: catalyst.id)
        type_id = WorkoutType.find_by(name: 'weight').id
        name = %w{ a b c d e }
        pieces.each_with_index do |p, i|
          movement_name = UnicodeUtils.compatibility_decomposition(/^(.*?)\ - /.match(p)[1])
          movement = Movement.find_by(name: movement_name)
          if movement.present?
            movement_id = movement.id
          else
            movement_id = Movement.create(name: movement_name).id
          end
          Workout.create(description: p, workout_type_id: type_id, wod_id: wod.id, name: name[i], movement_id: movement_id)
        end
      end
    end
  end
end
