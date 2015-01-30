require 'open-uri'

class WodsController < ApplicationController
  def show
    @wod = Wod.find(params[:id])
    if @wod.program.name == 'Catalyst Athletics'
      @piece = JSON.parse(@wod.description)
    else
      @piece = @wod.description.split(/[A-Z]\./)[1..-1]
    end
    @workout = Workout.new
    @statistics = @wod.statistics.group_by(&:user_id)
    @program = Wod.find(params[:id]).program
    @movements = Movement.all
    @edit_movements = {nil: 'none'}
    @movements.each { |m| @edit_movements[m.id] = m.name }
    @previous_workouts = Wod.associated_workouts(@wod)
    @edit_workouts = {nil: 'none'}
    @previous_workouts.each { |m| @edit_workouts[m[1]] = m[0] }
    @workout_types = WorkoutType.all
    @edit_types = {}
    @workout_types.each { |m| @edit_types[m.id] = m.name}
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
