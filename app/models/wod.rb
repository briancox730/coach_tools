class Wod < ActiveRecord::Base
  has_many :workouts
  belongs_to :program
  has_many :statistics, through: :workouts
end
