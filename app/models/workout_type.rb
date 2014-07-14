class WorkoutType < ActiveRecord::Base
  has_many :workouts

  validates_presence_of :name
  validates_uniqueness_of :name
end
