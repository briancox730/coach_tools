class Api::V1::ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
    @wods = @program.wods
  end
end
