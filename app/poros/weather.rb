class Weather
  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(current, daily, hourly)
    @id = nil
    @current_weather = current 
    @daily_weather = daily 
    @hourly_weather = hourly
  end
end