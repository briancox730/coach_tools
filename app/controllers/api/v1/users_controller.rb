class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticate_user!

  def show
    @to_complete = current_user.workouts_to_complete
    @statistics = current_user.statistics
    render json: @statistics, status: :ok
  end
end
