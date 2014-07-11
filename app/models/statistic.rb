class Statistic < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout

  validates_presence_of :user_id
  validates_presence_of :workout_id
  validates_presence_of :performance

  def self.performance_converter(performance)
    seconds = 0
    if performance.include?(':')
      time_array = performance.split(":")
      seconds = time_array[1].to_i
      seconds += time_array[0].to_i * 60
    else
      seconds = performance
    end
    seconds
  end

  def self.build_to_complete(available_workouts, completed_workouts)
    to_complete = []
    available_workouts.each do |w|
      flag = false
      completed_workouts.each do |c|
        if c.workout_id == w.id
          flag = true
        end
      end
      if !flag
        to_complete << w
      end
    end
    to_complete
  end
end
