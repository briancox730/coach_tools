class PersonalRecordsController < ApplicationController
  def index
    @pr = PersonalRecord.find(params[:user_id])
    binding.pry
  end

  def edit
    @pr = PersonalRecord.find(params[:id])
    binding.pry

  end

  def update

  end

end
