class UsersController < ApplicationController
  def index

  end

  def show
    @complete = Statistic.where(user_id: params[:id]).last(4)
    @to_complete = Program.find(current_user.program_id).workouts
  end
end
