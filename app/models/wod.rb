class Wod < ActiveRecord::Base
  has_many :workouts
  belongs_to :program
  has_many :statistics, through: :workouts

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :program_id

  def self.associated_workouts(wod)
    results = []

    wod.program.workouts.limit(25).sort_by(&:created_at).reverse.each do |w|
      name = w.wod.name.to_s + w.name.to_s + ' ' + Date.strptime(w.wod.name, "%y%m%d").strftime('%A')

      if !w.movement.nil?
        name += " " + w.movement.name
      end
      results << [ name, w.id ]
    end

    results
  end
end
