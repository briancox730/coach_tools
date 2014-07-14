class Wod < ActiveRecord::Base
  has_many :workouts
  belongs_to :program
  has_many :statistics, through: :workouts

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :program_id
end
