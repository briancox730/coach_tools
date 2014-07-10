class UsersController < ApplicationController
  def index

  end

  def show
    @complete = Statistic.where(user_id: params[:id])
    @available_workouts = Program.find(current_user.program_id).workouts

    @to_complete = Statistic.build_to_complete(@available_workouts, @complete)


    @statistic = Statistic.new
  end
end
