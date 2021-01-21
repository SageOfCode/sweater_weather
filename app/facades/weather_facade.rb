class WeatherFacade
  class << self 
    def weather_location(city)
      coords = LocationFacade.get_coords(city)
      get_current_weather(coords)
    end
    
    def get_current_weather(coords)
      data = WeatherService.weather_forecast(coords.lat, coords.lng)
      current_weather = CurrentWeather.new(data[:current])
      daily_weather = data[:daily][0..4].map { |json| DailyWeather.new(json) }
      hourly_weather = data[:hourly][0..7].map { |json| HourlyWeather.new(json) }
      all_weather = Weather.new(current_weather, daily_weather, hourly_weather)
    end

    def get_food_weather(lat, lng)
      WeatherService.weather_forecast(lat, lng)
    end
  end 
end