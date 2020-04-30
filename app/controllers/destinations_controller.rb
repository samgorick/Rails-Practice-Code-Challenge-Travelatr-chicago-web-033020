class DestinationsController < ApplicationController

  def show
    @destination = Destination.find(params[:id])
    p @destination.recent_five
  end

end