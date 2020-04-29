class DestinationsController < ApplicationController
  def show
    @destination = Destination.find_by(id: params[:id])
    @featured_post = @destination.featured_post
    @average_age = @destination.average_age
  end
end
