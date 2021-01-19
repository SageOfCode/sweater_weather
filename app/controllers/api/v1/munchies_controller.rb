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

    conn2 = Faraday.new(url: 'http://api.openweathermap.org') do |req|
      req.params['appid'] = ENV['weather_api_key']
    end
    response2 = conn2.get('/data/2.5/onecall') do |req|
      req.params['lat'] = distance_data[:route][:boundingBox][:lr][:lat]
      req.params['lon'] = distance_data[:route][:boundingBox][:lr][:lng]
    end
    forecast_data = JSON.parse(response2.body, symbolize_names: true)
    
    restaurant_data = RestaurantFacade.restaurant_data(params[:food], params[:destination])

    munchie_object = Munchie.new(params[:destination], distance_data, forecast_data, restaurant_data)
    
    render json: MunchieSerializer.new(munchie_object)
  end
end 