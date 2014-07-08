class ProgramsController < ApplicationController
  def show
    @program = Program.find(params[:id])
  end
end
