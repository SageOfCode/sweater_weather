require 'rails_helper'

describe WeatherFacade do
  context "class methods" do
    context ".weather_location" do
      it "returns weather data" do
        weather = WeatherFacade.weather_location("denver,co")

        expect(weather).to be_a(Weather)
        expect(weather.current_weather).to be_a(CurrentWeather)
        expect(weather.daily_weather).to be_a(Array)
        expect(weather.daily_weather.first).to be_a(DailyWeather)
        expect(weather.hourly_weather).to be_a(Array)
        expect(weather.hourly_weather.first).to be_a(HourlyWeather)
      end
    end
  end
end