class Statistic < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  belongs_to :wod

  validates_presence_of :user_id
  validates_presence_of :wod_id
  validates_presence_of :workout_id
  validates_presence_of :performance
end
