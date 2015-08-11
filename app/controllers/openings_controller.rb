class OpeningsController < ApplicationController
  require 'httparty'

  def index
    @openings  = Opening.all
    @countries = @openings.by_country
    @sectors   = @openings.by_sector
  end

  def show
    @opening = Opening.find(params[:id])
  end
end


