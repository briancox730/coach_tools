class PersonalRecordsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @pr = PersonalRecord.find(current_user.id)
  end

  def update
    @pr = PersonalRecord.find(params[:id])
    if @pr.update(personal_record_params)
      flash[:notice] = "Your changes were succesfully submitted."
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "Your changes were not succesfully submitted."
      render "edit"
    end
  end

  private

  def personal_record_params
    params.require(:personal_record).permit(:back_squat, :front_squat, :overhead_squat, :clean,
                                            :snatch, :power_clean, :power_snatch, :hang_clean,
                                            :hang_snatch, :split_jerk, :push_jerk, :push_press,
                                            :press, :dead_lift, :bench_press, :clean_and_jerk,
                                            :body_weight)
  end
end
