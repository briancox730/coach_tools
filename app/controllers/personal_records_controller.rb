# back_squat: nil, front_squat: nil, overhead_squat: nil, clean: nil,
# snatch: nil, power_clean: nil, power_snatch: nil, hang_clean: nil,
# hang_snatch: nil, split_jerk: nil, push_jerk: nil,
# push_press: nil, press: nil, dead_lift: nil

class PersonalRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pr = PersonalRecord.find_by(user_id: params[:user_id])
  end

  def edit
    @pr = PersonalRecord.find(params[:id])

  end

  def update
    @pr = PersonalRecord.find(params[:id])
    if @pr.update(personal_record_params)
      flash[:notice] = "Your changes were succesfully submitted."
      redirect_to user_personal_records_path(params[:user_id])
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
                                            :press, :dead_lift)
  end
end
