class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def index

  end

  def show
    @complete = Statistic.where(user_id: params[:id]).order(created_at: :desc).includes(:workout)
    @user = User.find(params[:id])
    if current_user.id == @user.id
      @available_workouts = Program.find(current_user.program_id).workouts
      @to_complete = Statistic.build_to_complete(@available_workouts, @complete)
    end
    @statistic = Statistic.new
    if !@user.personal_record.snatch.nil? && !@user.personal_record.clean_and_jerk.nil?
      @oly_data = Statistic.build_oly_data(params[:id])
      @oly_relative_data = Statistic.build_oly_relative_data(params[:id])
    end
    if !@user.personal_record.press.nil? && !@user.personal_record.back_squat.nil? && !@user.personal_record.dead_lift.nil?
      @cf_data = Statistic.build_cf_data(params[:id])
      @cf_relative_data = Statistic.build_cf_relative_data(params[:id])
    end
    if !@user.personal_record.bench_press.nil? && !@user.personal_record.back_squat.nil? && !@user.personal_record.dead_lift.nil?
      @power_data = Statistic.build_power_data(params[:id])
      @power_relative_data = Statistic.build_power_relative_data(params[:id])
    end
  end
end
