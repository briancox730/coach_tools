class StatisticsController < ApplicationController
  def index
    @statistic = Statistic.where(user_id: params[:id])
  end

  def show
    @statistic = Statistic.find(params[:id])
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
