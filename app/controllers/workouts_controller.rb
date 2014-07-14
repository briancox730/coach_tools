class WorkoutsController < ApplicationController
  def create
    @workout = Workout.new(workout_params)
    @workout[:wod_id] = params[:wod_id]

    if @workout.save
      flash[:notice] = "New part added"
      redirect_to @workout.wod
    else
      flash[:notice] = "The addition could not be saved"
      render @workout.wod
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :description, :workout_type_id, :wod_id, :movement_id, :workout_id)
  end
end
