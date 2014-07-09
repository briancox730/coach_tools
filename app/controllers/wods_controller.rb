require 'open-uri'

class WodsController < ApplicationController
  def show
    @wod = Wod.find(params[:id])
  end

  def new
    @wod = Wod.new
    entry = Nokogiri::HTML(open("http://www.crossfitinvictus.com/wod/july-9-2014-competition/"))
    @today = entry.css('.entry')
    # .each do |p|
    #   @today += p
    # end
  end

  def create
    @wod = Wod.new(wod_params)
    @wod[:program_id] = current_user.program_id

    if @wod.save(wod_params)
      flash[:notice] = "Your changes were succesfully submitted."
      redirect_to @wod
    else
      flash.now[:notice] = "Your changes were not succesfully submitted."
      render "new"
    end
  end

  private

  def wod_params
    params.require(:wod).permit(:name, :description)
  end
end
