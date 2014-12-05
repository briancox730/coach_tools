class ProgramsController < ApplicationController
  def index
    @programs = Program.all
    @users = User.all
  end

  def show
    @program = Program.includes(:users).find(params[:id])
    @wods = Wod.where(program_id: params[:id]).order(name: :desc).limit(10)
  end
end
