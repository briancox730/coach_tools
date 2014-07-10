class UsersController < ApplicationController
  def index

  end

  def show
    @complete = Statistic.where(user_id: params[:id])
    @available_workouts = Program.find(current_user.program_id).workouts

    @to_complete = []
    @available_workouts.each do |w|
      flag = false
      @complete.each do |c|
        if c.workout_id == w.id
          flag = true
        end
      end
      if !flag
        @to_complete << w
      end
    end

    @statistic = Statistic.new
  end
end
