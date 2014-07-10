class Workout < ActiveRecord::Base
  has_many :statistics
  belongs_to :wod
  belongs_to :workout_type
end
