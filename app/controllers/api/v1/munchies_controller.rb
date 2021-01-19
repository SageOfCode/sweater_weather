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
 
    conn3 = Faraday.new(url: 'https://api.yelp.com') do |req|
      req.headers["Authorization"] = ENV['yelp_api_key']
    end
    response3 = conn3.get('/v3/businesses/search') do |req|
      req.params['term'] = params[:food]
      req.params['location'] = params[:destination]
    end
    restaurant_data = JSON.parse(response3.body, symbolize_names: true)

    require 'pry'; binding.pry
  end
end 