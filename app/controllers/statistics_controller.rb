class StatisticsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @completed = @user.statistics.includes(workout: :wod)
    @statistics = @completed.group_by{|s| s.workout.wod }
    if current_user.id == @user.id
      @statistic = Statistic.new
      @available_workouts = []
      @user.program.wods.includes(:workouts).last(10).each {|w| @available_workouts << w.workouts}
      @available_workouts = @available_workouts.flatten!
      @to_complete = Statistic.build_to_complete(@available_workouts, @completed).reverse
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
    @statistic = Statistic.new(statistic_params)
    @statistic[:user_id] = params[:user_id]
    @statistic[:workout_id] = params[:workout_id]
    @statistic[:performance] = Statistic.performance_converter(statistic_params[:performance])
    if @statistic.save
      flash[:notice] = "Your performance was succesfully submitted."
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Your performance was not succesfully submitted."
      redirect_to user_path(current_user)
    end
  end

  private

  def statistic_params
    params.require(:statistic).permit(:performance, :comment)
  end
end
