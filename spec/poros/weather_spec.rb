require 'rails_helper'
describe 'Weather' do
  it 'exists and has attributes' do

    current = {current: "weather"}
    daily = {daily: "weather"}
    hourly = {hourly: "weather"}

    weather = Weather.new(current, daily, hourly)
  
    expect(weather).to be_a(Weather)
    expect(weather.id).to eq(nil)
    expect(weather.current_weather).to eq(current)
    expect(weather.daily_weather).to eq(daily)
    expect(weather.hourly_weather).to eq(hourly)
  end
end 