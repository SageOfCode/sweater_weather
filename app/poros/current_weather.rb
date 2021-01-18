class CurrentWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(current_weather_data)
    @date       = DateTime.strptime(current_weather_data[:dt].to_s, '%s')
    @sunrise    = DateTime.strptime(current_weather_data[:sunrise].to_s, '%s')
    @sunset     = DateTime.strptime(current_weather_data[:sunset].to_s, '%s')
    @temp       = current_weather_data[:temp].to_f
    @feels_like = current_weather_data[:feels_like].to_f
    @humidity   = current_weather_data[:humidity]
    @uvi        = current_weather_data[:uvi]
    @conditions = current_weather_data[:weather][0][:description]
    @icon       = current_weather_data[:weather][0][:icon]
  end
end
