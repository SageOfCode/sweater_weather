class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location] != ""
      forecast = WeatherFacade.weather_location(params[:location])
      render json: ForecastSerializer.new(forecast)
    else
      render body: "Invalid Query", status: 400
    end
  end
end