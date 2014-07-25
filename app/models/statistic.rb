class Statistic < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout

  validates_presence_of :user_id
  validates_presence_of :workout_id
  validates_presence_of :performance

  def self.build_oly_data(user)
    @user = User.find(user.to_i)
    @program = Program.find(@user.program_id).users.includes(:personal_record)
    user_snatch = @user.personal_record.snatch
    user_cnj = @user.personal_record.clean_and_jerk
    user_total = user_snatch + user_cnj
    avg_snatch = @program.average(:snatch).to_i
    avg_cnj = @program.average(:clean_and_jerk).to_i
    data = {
    labels: ["Snatch", "Clean and Jerk", "Total"],
    datasets: [
        {
            label: "User",
            fillColor: "rgba(83,187,244,0.2)",
            strokeColor: "rgba(83,187,244,1)",
            pointColor: "rgba(83,187,244,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [user_snatch, user_cnj, user_total]
        },
        {
            label: "Group Average",
            fillColor: "rgba(177,235,0,0.2)",
            strokeColor: "rgba(177,235,0,1)",
            pointColor: "rgba(177,235,0,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [avg_snatch, avg_cnj, (avg_snatch + avg_cnj)]
        }
    ]}
  end

  def self.build_cf_data(user)
    @user = User.find(user.to_i)
    @program = Program.find(@user.program_id).users.includes(:personal_record)
    user_press = @user.personal_record.press
    user_squat = @user.personal_record.back_squat
    user_dead = @user.personal_record.dead_lift
    user_total = user_press + user_squat + user_dead

    avg_press = @program.average(:press).to_i
    avg_squat = @program.average(:back_squat).to_i
    avg_dead = @program.average(:dead_lift).to_i
    avg_total = avg_press + avg_squat + avg_dead
    data = {
    labels: ["Press", "Squat", "Deadlift", "Total"],
    datasets: [
        {
            label: "User",
            fillColor: "rgba(255,133,203,0.2)",
            strokeColor: "rgba(255,133,203,1)",
            pointColor: "rgba(255,133,203,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [user_press, user_squat, user_dead, user_total]
        },
        {
            label: "Group Average",
            fillColor: "rgba(177,235,0,0.2)",
            strokeColor: "rgba(177,235,0,1)",
            pointColor: "rgba(177,235,0,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [avg_press, avg_squat, avg_dead, avg_total]
        }
    ]}
  end

  def self.build_power_data(user)
    @user = User.find(user.to_i)
    @program = Program.find(@user.program_id).users.includes(:personal_record)
    user_bench_press = @user.personal_record.bench_press
    user_squat = @user.personal_record.back_squat
    user_dead = @user.personal_record.dead_lift
    user_total = user_bench_press + user_squat + user_dead

    avg_bench_press = @program.average(:bench_press).to_i
    avg_squat = @program.average(:back_squat).to_i
    avg_dead = @program.average(:dead_lift).to_i
    avg_total = avg_bench_press + avg_squat + avg_dead
    data = {
    labels: ["Bench", "Squat", "Deadlift", "Total"],
    datasets: [
        {
            label: "User",
            fillColor: "rgba(255,67,46,0.2)",
            strokeColor: "rgba(255,67,46,1)",
            pointColor: "rgba(255,67,46,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [user_bench_press, user_squat, user_dead, user_total]
        },
        {
            label: "Group Average",
            fillColor: "rgba(177,235,0,0.2)",
            strokeColor: "rgba(177,235,0,1)",
            pointColor: "rgba(177,235,0,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [avg_bench_press, avg_squat, avg_dead, avg_total]
        }
    ]}
  end

  def self.build_oly_relative_data(user)
    @user = User.find(user.to_i)
    @program = Program.find(@user.program_id).users.includes(:personal_record)
    user_snatch = @user.personal_record.snatch.to_f / @user.personal_record.body_weight.to_f
    user_cnj = @user.personal_record.clean_and_jerk.to_f  / @user.personal_record.body_weight.to_f
    user_total = (@user.personal_record.snatch.to_f + @user.personal_record.clean_and_jerk.to_f)  / @user.personal_record.body_weight.to_f
    avg_snatch = @program.average(:snatch).to_f / @program.average(:body_weight).to_f
    avg_cnj = @program.average(:clean_and_jerk).to_f  / @program.average(:body_weight).to_f
    avg_total = (@program.average(:snatch).to_f + @program.average(:clean_and_jerk).to_f) / @program.average(:body_weight).to_f
    data = {
    labels: ["Snatch", "Clean and Jerk", "Total"],
    datasets: [
        {
            label: "User",
            fillColor: "rgba(83,187,244,0.2)",
            strokeColor: "rgba(83,187,244,1)",
            pointColor: "rgba(83,187,244,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [user_snatch.round(2), user_cnj.round(2), user_total.round(2)]
        },
        {
            label: "Group Average",
            fillColor: "rgba(177,235,0,0.2)",
            strokeColor: "rgba(177,235,0,1)",
            pointColor: "rgba(177,235,0,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [avg_snatch.round(2), avg_cnj.round(2), avg_total.round(2)]
        }
    ]}
  end

  def self.build_cf_relative_data(user)
    @user = User.find(user.to_i)
    @program = Program.find(@user.program_id).users.includes(:personal_record)
    user_press = @user.personal_record.press.to_f / @user.personal_record.body_weight.to_f
    user_squat = @user.personal_record.back_squat.to_f / @user.personal_record.body_weight.to_f
    user_dead = @user.personal_record.dead_lift.to_f / @user.personal_record.body_weight.to_f
    user_total = (@user.personal_record.press.to_f + @user.personal_record.back_squat.to_f + @user.personal_record.dead_lift.to_f)  / @user.personal_record.body_weight.to_f

    avg_press = @program.average(:press).to_f / @program.average(:body_weight).to_f
    avg_squat = @program.average(:back_squat).to_f / @program.average(:body_weight).to_f
    avg_dead = @program.average(:dead_lift).to_f / @program.average(:body_weight).to_f
    avg_total = (@program.average(:press).to_f + @program.average(:back_squat).to_f + @program.average(:dead_lift).to_f) / @program.average(:body_weight).to_f
    data = {
    labels: ["Press", "Squat", "Deadlift", "Total"],
    datasets: [
        {
            label: "User",
            fillColor: "rgba(255,133,203,0.2)",
            strokeColor: "rgba(255,133,203,1)",
            pointColor: "rgba(255,133,203,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [user_press.round(2), user_squat.round(2), user_dead.round(2), user_total.round(2)]
        },
        {
            label: "Group Average",
            fillColor: "rgba(177,235,0,0.2)",
            strokeColor: "rgba(177,235,0,1)",
            pointColor: "rgba(177,235,0,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [avg_press.round(2), avg_squat.round(2), avg_dead.round(2), avg_total.round(2)]
        }
    ]}
  end

  def self.build_power_relative_data(user)
    @user = User.find(user.to_i)
    @program = Program.find(@user.program_id).users.includes(:personal_record)
    user_body_weight = @user.personal_record.body_weight.to_f
    user_bench_press = @user.personal_record.bench_press.to_f / user_body_weight
    user_squat = @user.personal_record.back_squat.to_f / user_body_weight
    user_dead = @user.personal_record.dead_lift.to_f / user_body_weight
    user_total = (@user.personal_record.bench_press.to_f + @user.personal_record.back_squat.to_f + @user.personal_record.dead_lift.to_f) / user_body_weight

    avg_body_weight = @program.average(:body_weight).to_f
    avg_bench_press = @program.average(:bench_press).to_f / avg_body_weight
    avg_squat = @program.average(:back_squat).to_f / avg_body_weight
    avg_dead = @program.average(:dead_lift).to_f / avg_body_weight
    avg_total = (@program.average(:bench_press) + @program.average(:back_squat).to_f + @program.average(:dead_lift).to_f) / avg_body_weight
    data = {
    labels: ["Bench", "Squat", "Deadlift", "Total"],
    datasets: [
        {
            label: "User",
            fillColor: "rgba(255,67,46,0.2)",
            strokeColor: "rgba(255,67,46,1)",
            pointColor: "rgba(255,67,46,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [user_bench_press.round(2), user_squat.round(2), user_dead.round(2), user_total.round(2)]
        },
        {
            label: "Group Average",
            fillColor: "rgba(177,235,0,0.2)",
            strokeColor: "rgba(177,235,0,1)",
            pointColor: "rgba(177,235,0,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [avg_bench_press.round(2), avg_squat.round(2), avg_dead.round(2), avg_total.round(2)]
        }
    ]}
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
      flag = true
      completed_workouts.each do |c|
        if c.workout_id == w.id
          flag = false
        end
      end
      if flag
        to_complete << w
      end
      binding.pry
    end
    to_complete.sort_by(&:created_at).reverse
  end
end
