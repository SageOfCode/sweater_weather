class Api::V1::MunchiesController < ApplicationController
  def index
    distance_data = LocationFacade.get_distance(params[:start], params[:destination])

    forecast_data = WeatherFacade.get_food_weather(distance_data[:route][:boundingBox][:lr][:lat], distance_data[:route][:boundingBox][:lr][:lng])
    
    restaurant_data = RestaurantFacade.restaurant_data(params[:food], params[:destination])

    munchie_object = Munchie.new(params[:destination], distance_data, forecast_data, restaurant_data)
    
    render json: MunchieSerializer.new(munchie_object)
  end
end 