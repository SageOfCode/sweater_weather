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
    case degree
    when 348.75..11.25
      'N' 
    when 11.25..33.75
      'NNE' 
    when 33.75..56.25
      'NE' 
    when 56.25..78.75
      'ENE' 
    when 78.75..101.25
      'E' 
    when 101.25..123.75
      'ESE' 
    when 123.75..146.25
      'SE' 
    when 146.25..168.75
      'SSE' 
    when 168.75..191.25
      'S' 
    when 191.25..213.75
      'SSW' 
    when 213.75..236.25
      'SW' 
    when 236.25..258.75
      'WSW' 
    when 258.75..281.25
      'W' 
    when 281.25..303.75
      'WNW' 
    when 303.75..326.25
      'NW' 
    when 326.25..348.75
      'NNW' 
    else
      "No wind direction found"
    end
  end
end