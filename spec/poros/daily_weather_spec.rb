require 'rails_helper'
describe 'CurrentWeather' do
  it 'exists and has attributes' do
    daily_weather_data = {
        :dt=>1611082800,
        :sunrise=>1611065827,
        :sunset=>1611101043,
        :temp=>{:day=>273.79, :min=>270.37, :max=>275.62, :night=>273, :eve=>273.91, :morn=>271.32},
        :feels_like=>{:day=>269.51, :night=>268.94, :eve=>270.72, :morn=>267.94},
        :pressure=>1032,
        :humidity=>69,
        :dew_point=>258.65,
        :wind_speed=>2.48,
        :wind_deg=>166,
        :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}],
        :clouds=>100,
        :pop=>0.39,
        :uvi=>1.87
      }
    daily_weather = DailyWeather.new(daily_weather_data)
  
    expect(daily_weather).to be_a(DailyWeather)
    expect(daily_weather.date).to eq(DateTime.strptime(daily_weather_data[:dt].to_s, '%s'))
    expect(daily_weather.sunrise).to eq(DateTime.strptime(daily_weather_data[:sunrise].to_s, '%s'))
    expect(daily_weather.sunset).to eq(DateTime.strptime(daily_weather_data[:sunset].to_s, '%s'))
    expect(daily_weather.max_temp).to eq(daily_weather_data[:temp][:max])
    expect(daily_weather.min_temp).to eq(daily_weather_data[:temp][:min])
    expect(daily_weather.conditions).to eq(daily_weather_data[:weather][0][:description])
    expect(daily_weather.icon).to eq(daily_weather_data[:weather][0][:icon])
  end
end 