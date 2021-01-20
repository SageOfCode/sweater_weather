class Api::V1::ForecastController < ApplicationController
  def index
    forecast = WeatherFacade.weather_location(params[:location])
    if forecast 
      render json: ForecastSerializer.new(forecast)
    else 
      render body: "Invalid Query", status: 400
    end
  end
end