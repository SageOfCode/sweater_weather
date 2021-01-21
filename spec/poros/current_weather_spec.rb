require 'rails_helper'
describe 'CurrentWeather' do
  it 'exists and has attributes' do
    current_weather_data = {:dt=>1611113435,
        :sunrise=>1611065827,
        :sunset=>1611101043,
        :temp=>270.36,
        :feels_like=>267.24,
        :pressure=>1029,
        :humidity=>57,
        :dew_point=>263.84,
        :uvi=>0,
        :clouds=>0,
        :visibility=>10000,
        :wind_speed=>0.08,
        :wind_deg=>89,
        :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]
      }
    current_weather = CurrentWeather.new(current_weather_data)
  
    expect(current_weather).to be_a(CurrentWeather)
    expect(current_weather.date).to eq(DateTime.strptime(current_weather_data[:dt].to_s, '%s'))
    expect(current_weather.sunrise).to eq(DateTime.strptime(current_weather_data[:sunrise].to_s, '%s'))
    expect(current_weather.sunset).to eq(DateTime.strptime(current_weather_data[:sunset].to_s, '%s'))
    expect(current_weather.temp).to eq(current_weather_data[:temp].to_f)
    expect(current_weather.feels_like).to eq(current_weather_data[:feels_like].to_f)
    expect(current_weather.humidity).to eq(current_weather_data[:humidity])
    expect(current_weather.uvi).to eq(current_weather_data[:uvi])
    expect(current_weather.conditions).to eq(current_weather_data[:weather][0][:description])
    expect(current_weather.icon).to eq(current_weather_data[:weather][0][:icon])
  end
end 