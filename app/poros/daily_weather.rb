class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon
  def initialize(daily_weather_data)
    @date       = DateTime.strptime(daily_weather_data[:dt].to_s, '%s')
    @sunrise    = DateTime.strptime(daily_weather_data[:sunrise].to_s, '%s')
    @sunset     = DateTime.strptime(daily_weather_data[:sunset].to_s, '%s')
    @max_temp   = daily_weather_data[:temp][:max]
    @min_temp   = daily_weather_data[:temp][:min]
    @conditions = daily_weather_data[:weather][0][:description]
    @icon       = daily_weather_data[:weather][0][:icon]
  end
end