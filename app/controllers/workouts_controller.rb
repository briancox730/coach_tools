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

  def update
    @workout = Workout.find(params[:id])

    respond_to do |format|
      if @workout.update_attributes(workout_params)
        format.json { respond_with_bip(@workout) }
      else
        format.json { respond_with_bip(@workout) }
      end
    end
  end

  def destroy
    @workout = Workout.find(params[:id])

    if @workout.delete
      flash[:notice] = "Part #{@workout.name} removed!"
      redirect_to wod_path(id: @workout.wod_id)
    else
      flash[:notice] = 'Delete Failed!'
      redirect_to wod_path(id: @workout.wod_id)
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :description, :workout_type_id, :wod_id, :movement_id, :workout_id)
  end
end
