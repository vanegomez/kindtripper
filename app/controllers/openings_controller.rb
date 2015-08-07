class OpeningsController < ApplicationController
  require 'httparty'
  def index
    @openings  = Opening.all
    @countries = @openings.pluck(:country).uniq
    @sectors   = @openings.pluck(:sector).uniq
  end

  def show
    @opening = Opening.find(params[:id])
  end
end


