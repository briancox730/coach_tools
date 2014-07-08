class PersonalRecordsController < ApplicationController
  def index
    @pr = PersonalRecord.find(params[:user_id])
  end

  def edit
    @pr = PersonalRecord.find(params[:id])

  end

  def update

  end

end
