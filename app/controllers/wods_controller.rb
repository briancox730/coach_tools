require 'open-uri'

class WodsController < ApplicationController
  def show
    @wod = Wod.find(params[:id])
    @piece = @wod.description.split(/[A-Z]\./)[1..-1]
    @workouts = Workout.where(wod_id: @wod.id)
    @workout = Workout.new
  end

  def new
    @wod = Wod.new
  end

  def create
    @wod = Wod.new(wod_params)
    @wod[:program_id] = current_user.program_id

    if @wod.save(wod_params)
      flash[:notice] = "Your changes were succesfully submitted."
      redirect_to @wod
    else
      flash.now[:notice] = "Your changes were not succesfully submitted."
      render "new"
    end
  end

  private

  def wod_params
    params.require(:wod).permit(:name, :description)
  end
end
