class Wod < ActiveRecord::Base
  has_many :workouts
  belongs_to :program
end
