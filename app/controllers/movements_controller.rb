class MovementsController < ApplicationController
  def index
    @movements = Movement.all.includes(:workouts)
    @new_movement = Movement.new
  end

  def create
    @movement = Movement.new(movement_params)

    if @movement.save
      flash[:notice] = "Movement saved!"
      redirect_to movements_path
    else
      flash[:notice] = "Movement save failed!"
      redirect_to movements_path
    end
  end

  def update
    @movement = Movement.find(params[:id])

    respond_to do |format|
      if @movement.update(movement_params)
        format.json { respond_with_bip(@movement) }
      else
        format.json { respond_with_bip(@movement) }
      end
    end
  end

  def merge
    @movement = Movement.find(params[:id])

  end

  def merge_update
    params = movement_update_params
    if params[:merge_id] == ""
      flash[:notice] = "merge id cannot be blank"
      redirect_to movements_path
    elsif params[:movement_id] == params[:merge_id]
      flash[:notice] = "cannot select the same movement"
      redirect_to movements_path
    else
      @workouts = Workout.where(movement_id: params[:movement_id])
      @count = @workouts.count
      if @workouts.update_all(movement_id: params[:merge_id])
        Movement.find(params[:movement_id]).delete
        flash[:notice] = "#{@count} merged"
        redirect_to movements_path
      else
        flash[:notice] = "merge failed"
        redirect_to movements_path
      end
    end
  end

  private

  def movement_update_params
    params.require(:admin).permit(:movement_id, :merge_id)
  end

  def movement_params
    params.require(:movement).permit(:name)
  end
end
