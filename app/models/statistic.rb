class Statistic < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout

  validates_presence_of :user_id
  validates_presence_of :workout_id
  validates_presence_of :performance

  def self.get_fs_chart(user)
    data = {
      labels: [],
      datasets: [
          {
              label: "My First dataset",
              fillColor: "rgba(0,255,0,0.2)",
              strokeColor: "rgba(0,255,0,1)",
              pointColor: "rgba(144,238,144,1)",
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: "rgba(220,220,220,1)",
              data: []
          },
          # {
          #     label: "My Second dataset",
          #     fillColor: "rgba(0,255,255,0.2)",
          #     strokeColor: "rgba(0,255,255,1)",
          #     pointColor: "rgba(32,178,170,1)",
          #     pointStrokeColor: "#fff",
          #     pointHighlightFill: "#fff",
          #     pointHighlightStroke: "rgba(151,187,205,1)",
          #     data: [28, 48, 40]
          # }
          ]}
    available_stats = Statistic.where(user_id: user.id)
    available_stats.each do |s|
      data[:labels] << s.workout.wod.name
      data[:datasets][0][:data] << s.performance
    end
    data
  end

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
    to_complete.sort_by(&:created_at).reverse
  end
end
