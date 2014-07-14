class Workout < ActiveRecord::Base
  has_many :statistics
  belongs_to :wod
  belongs_to :workout_type
  belongs_to :movement

  validates_presence_of :workout_type_id
  validates_presence_of :wod_id
  validates_presence_of :name
  validates_presence_of :description
end
