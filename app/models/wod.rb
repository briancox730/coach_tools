class Wod < ActiveRecord::Base
  has_many :workouts
  belongs_to :program
  has_many :statistics, through: :workouts

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :program_id

  def self.associated_workouts(wod)
    results = []

    wod.program.workouts.each do |w|
      results << [ w.wod.name.to_s + w.name.to_s, w.id ]
    end
    binding.pry
    results
  end
end
