class StatisticsController < ApplicationController
  def index
    @statistics = Statistic.where(user_id: params[:user_id]).includes(:workout).group_by{ |s| s.workout.wod }
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
