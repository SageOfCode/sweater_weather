class Api::V1::RoadTripController < ApplicationController
  def create
    # require 'pry'; binding.pry
    user = User.find_by(api_key: params[:api_key])
    if user
      road_trip = RoadtripFacade.get_road_trip_data(params[:origin], params[:destination])
      render json: RoadtripSerializer.new(road_trip)
    else 
      render json: "Invalid Credentials", status: 401
    end
  end
end 