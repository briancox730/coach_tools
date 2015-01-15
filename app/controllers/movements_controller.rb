class MovementsController < ApplicationController
  def index
    @movements = Movement.all
  end

  def update
    @movement = Movement.find(params[:id])

    respond_to do |format|
      if @movement.update_attributes(movement_params)
        format.json { respond_with_bip(@movement) }
      else
        format.json { respond_with_bip(@movement) }
      end
    end
  end

  private

  def movement_params
    params.require(:movement).permit(:name)
  end
end
