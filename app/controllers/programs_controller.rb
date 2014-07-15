class ProgramsController < ApplicationController
  def show
    @program = Program.includes(:users).find(params[:id])
    @wods = Wod.where(program_id: params[:id]).order(name: :desc)
  end
end
