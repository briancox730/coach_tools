class StatisticsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @completed = @user.statistics.includes(workout: :wod)
    @statistics = @completed.group_by{|s| s.workout.wod }
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
    @statistic.body_weight_ratio = @user.personal_record.body_weight.zero? ? 0 : @statistic.performance / @user.personal_record.body_weight

    if @statistic.save
      flash[:notice] = "Your performance was succesfully submitted."
      redirect_to request.referrer
    else
      flash[:notice] = "Your performance was not succesfully submitted."
      redirect_to request.referrer
    end
  end

  private

  def statistic_params
    params.require(:statistic).permit(:performance, :comment)
  end
end
