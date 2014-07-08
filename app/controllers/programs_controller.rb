class ProgramsController < ApplicationController
  def show
    @program = Program.find(params[:id])
    @users = User.where(program_id: @program.id)
  end
end
