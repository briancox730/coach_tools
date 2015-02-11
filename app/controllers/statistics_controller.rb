class StatisticsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @completed = @user.statistics.includes(workout: :wod)
    @statistics = @completed.group_by{|s| s.workout.wod }
    @movements = Movement.all.includes(:workouts).select{|m| m.workouts.count > 5}
    if current_user.present?
      if current_user.id == @user.id
        @statistic = Statistic.new
        @available_workouts = []
        @user.program.wods.includes(workouts: :workout_type).last(10).each {|w| @available_workouts << w.workouts}
        @available_workouts = @available_workouts.flatten!
        @to_complete = Statistic.build_to_complete(@available_workouts, @completed.last(50)).group_by{|w| w.wod.name }
      end
    end
  end

  def update
    @statistic = Statistic.find(params[:id])

    respond_to do |format|
      if @statistic.update_attributes(statistic_params)
        format.json { respond_with_bip(@statistic) }
      else
        format.json { respond_with_bip(@statistic) }
      end
    end
  end

  def create
    @user = User.find(params[:user_id])
    @statistic = Statistic.new(statistic_params)
    @statistic.user_id = params[:user_id]
    @statistic.workout_id = params[:workout_id]
    @statistic.performance = Statistic.performance_converter(statistic_params[:performance])
    @statistic.body_weight_ratio = @user.personal_record.body_weight.zero? ? 0 : @statistic.performance.to_f / @user.personal_record.body_weight.to_f

    if @statistic.save
      flash[:notice] = "Your performance was succesfully submitted."
      redirect_to request.referrer
    else
      flash[:notice] = "Your performance was not succesfully submitted."
      redirect_to request.referrer
    end
  end

  def movement_stats
    @movement = Movement.find(params[:movement_id])
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @colors = [["rgba(83,187,244,0.2)", "rgba(83,187,244,1)"], ["rgba(177,235,0,0.2)", "rgba(177,235,0,1)"], ["rgba(255,133,203,0.2)", "rgba(255,133,203,1)"], ["rgba(255,67,46,0.2)", "rgba(255,67,46,1)"]]
    @color = @colors[(1 + rand(@colors.size)).floor]
    @statistics = Statistic.where(user_id: @user_id, workout_id: @movement.workouts.where(workout_type: 13).last(10).map(&:id)).sort_by(&:created_at)
    @data = {}
    @data[:labels] = @statistics.map { |s| s.created_at.to_date.strftime('%m-%d-%y') }
    @data[:datasets] = [{
                        label: @user.first_name,
                        fillColor: @color[0],
                        strokeColor: @color[1],
                        pointColor: @color[1],
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba(220,220,220,1)",
                        data: @statistics.map { |s| s.performance }
                        }]
    render json: @data
  end

  private

  def statistic_params
    params.require(:statistic).permit(:performance, :comment)
  end
end
