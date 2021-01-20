require 'rails_helper'
describe 'HourlyWeather' do
  it 'exists and has attributes' do
    hourly_weather_data = {
      :dt=>1611111600,
      :temp=>270.27,
      :feels_like=>266.78,
      :pressure=>1029,
      :humidity=>59,
      :dew_point=>264.14,
      :uvi=>0,
      :clouds=>0,
      :visibility=>10000,
      :wind_speed=>0.64,
      :wind_deg=>318,
      :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
      :pop=>0
    }
    hourly_weather = HourlyWeather.new(hourly_weather_data)
  
    expect(hourly_weather).to be_a(HourlyWeather)
    expect(hourly_weather.time).to eq(Time.at(hourly_weather_data[:dt]).strftime("%H:%M:%S"))
    expect(hourly_weather.temp).to eq(hourly_weather_data[:temp])
    expect(hourly_weather.wind_speed).to eq(hourly_weather_data[:wind_speed].to_s << "mph")
    expect(hourly_weather.wind_direction).to eq(hourly_weather.get_wind_direction(hourly_weather_data[:wind_deg]))
    expect(hourly_weather.conditions).to eq(hourly_weather_data[:weather][0][:description])
    expect(hourly_weather.icon).to eq(hourly_weather_data[:weather][0][:icon])
  end
end 