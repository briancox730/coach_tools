class Api::V1::WodsController < ApplicationController
  def show
    @wod = Wod.find(params[:id])
  end
end
