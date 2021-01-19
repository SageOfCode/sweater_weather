class Api::V1::MunchiesController < ApplicationController
  def index
    conn = Faraday.new("http://www.mapquestapi.com") do |f|
      f.params['key'] = ENV['map_api_key']
    end
    response = conn.get("/directions/v2/route") do |r|
      r.params['from'] = params[:start]
      r.params['to'] = params[:destination]
    end 
    distance_data = JSON.parse(response.body, symbolize_names: true)

    forecast_data = WeatherFacade.get_food_weather(distance_data[:route][:boundingBox][:lr][:lat], distance_data[:route][:boundingBox][:lr][:lng])
    
    restaurant_data = RestaurantFacade.restaurant_data(params[:food], params[:destination])

    munchie_object = Munchie.new(params[:destination], distance_data, forecast_data, restaurant_data)
    
    render json: MunchieSerializer.new(munchie_object)
  end
end 