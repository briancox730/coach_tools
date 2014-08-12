class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def index

  end

  def show
    @time = Time.now.strftime("%y%m%d")
    @user = User.find(params[:id])
    @complete = @user.statistics.limit(15).order(created_at: :asc).includes(:workout).group_by { |statistic| statistic.workout.wod_id }
    @completed = @user.statistics
    if current_user.id == @user.id
      if @user.program.wods.find_by(name: @time).nil?
        @to_complete = []
      else
        @available_workouts = @user.program.wods.find_by(name: @time).workouts
        @to_complete = Statistic.build_to_complete(@available_workouts, @completed).reverse
      end
    end
    @statistic = Statistic.new
    if @user.personal_record.snatch.present? && @user.personal_record.clean_and_jerk.present?
      @oly_data = Statistic.build_oly_data(@user.id)
      @oly_relative_data = Statistic.build_oly_relative_data(@user.id)
    end
    if @user.personal_record.press.present? && @user.personal_record.back_squat.present? && @user.personal_record.dead_lift.present?
      @cf_data = Statistic.build_cf_data(@user.id)
      @cf_relative_data = Statistic.build_cf_relative_data(@user.id)
    end
    if @user.personal_record.bench_press.present? && @user.personal_record.back_squat.present? && @user.personal_record.dead_lift.present?
      @power_data = Statistic.build_power_data(@user.id)
      @power_relative_data = Statistic.build_power_relative_data(@user.id)
    end
  end
end
