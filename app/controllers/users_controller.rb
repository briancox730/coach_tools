class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  def index

  end

  def show
    @complete = Statistic.where(user_id: params[:id])
    @user = User.find(params[:id])
    if current_user.id = @user.id
      @available_workouts = Program.find(current_user.program_id).workouts
      @to_complete = Statistic.build_to_complete(@available_workouts, @complete)
    end
    @statistic = Statistic.new
  end
end
