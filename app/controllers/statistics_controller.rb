class StatisticsController < ApplicationController
  def create
    @statistic = Statistic.new(statistic_params)
    @statistic[:user_id] = params[:user_id]
    @statistic[:workout_id] = params[:workout_id]
    @statistic[:performance] = Statistic.performance_converter(statistic_params[:performance])
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
end
