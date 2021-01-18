class HourlyWeather
  attr_reader :time,
              :temp,
              :wind_spped,
              :wind_direction,
              :conditions,
              :icon

  def initialize(hourly_weather_data)
    @time           = Time.at(hourly_weather_data[:dt]).strftime("%H:%M:%S")
    @temp           = hourly_weather_data[:temp]
    @wind_speed     = hourly_weather_data[:wind_speed].to_s << "mph"
    @wind_direction = get_wind_direction(hourly_weather_data[:wind_deg])
    @conditions     = hourly_weather_data[:weather][0][:description]
    @icon           = hourly_weather_data[:weather][0][:icon]
  end

  def get_wind_direction(degree)
    selector = (((degree - 11.25) / 22.5) + 0.5).round
    direction_array = ["N", "NNE", "NE", "ENE", "E", "ESE",  "SE",  "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    direction_array[(selector.abs % 16)]
  end
end