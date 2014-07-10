class StatisticsController < ApplicationController
  def create
    @statistic = Statistic.new(statistic_params)
    @statistic[:user_id] = params[:user_id]
    @statistic[:workout_id] = params[:workout_id]
    @statistic[:performance] = performance_converter
    if @statistic.save
      flash[:notice] = "Your performance was succesfully submitted."
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "Your performance was not succesfully submitted."
      redirect_to users_path
    end
  end

  private

  def statistic_params
    params.require(:statistic).permit(:performance, :comment)
  end

  def performance_converter
    seconds = 0
    if statistic_params[:performance].include?(':')
      time_array = statistic_params[:performance].split(":")
      seconds = time_array[1].to_i
      seconds += time_array[0].to_i * 60
    else
      seconds += statistic_params[:performance].to_i * 60
    end
    seconds
  end
end
