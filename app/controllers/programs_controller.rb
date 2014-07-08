class ProgramsController < ApplicationController
  def show
    @program = Program.find(params[:id])
    @wods = Wod.where(program_id: params[:id]).order(created_at: :desc)
    @users = User.where(program_id: params[:id])
  end
end
