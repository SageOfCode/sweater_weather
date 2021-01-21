require 'rails_helper'
describe 'HourlyWeather' do
  before :each do 
    @hourly_weather_data = {
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
    @hourly_weather = HourlyWeather.new(@hourly_weather_data)
  end
  it 'exists and has attributes' do
    
    expect(@hourly_weather).to be_a(HourlyWeather)
    expect(@hourly_weather.time).to eq(Time.at(@hourly_weather_data[:dt]).strftime("%H:%M:%S"))
    expect(@hourly_weather.temp).to eq(@hourly_weather_data[:temp])
    expect(@hourly_weather.wind_speed).to eq(@hourly_weather_data[:wind_speed].to_s << "mph")
    expect(@hourly_weather.wind_direction).to eq(@hourly_weather.get_wind_direction(@hourly_weather_data[:wind_deg]))
    expect(@hourly_weather.conditions).to eq(@hourly_weather_data[:weather][0][:description])
    expect(@hourly_weather.icon).to eq(@hourly_weather_data[:weather][0][:icon])
  end
  describe "instance methods" do 
    it "#get_wind_direction" do 
      expect(@hourly_weather.get_wind_direction(10)).to eq("N")
      expect(@hourly_weather.get_wind_direction(12)).to eq("NNE")
      expect(@hourly_weather.get_wind_direction(35)).to eq("NE")
      expect(@hourly_weather.get_wind_direction(70)).to eq("ENE")
      expect(@hourly_weather.get_wind_direction(100)).to eq("E")
      expect(@hourly_weather.get_wind_direction(110)).to eq("ESE")
      expect(@hourly_weather.get_wind_direction(140)).to eq("SE")
      expect(@hourly_weather.get_wind_direction(150)).to eq("SSE")
      expect(@hourly_weather.get_wind_direction(170)).to eq("S")
      expect(@hourly_weather.get_wind_direction(200)).to eq("SSW")
      expect(@hourly_weather.get_wind_direction(230)).to eq("SW")
      expect(@hourly_weather.get_wind_direction(240)).to eq("WSW")
      expect(@hourly_weather.get_wind_direction(280)).to eq("W")
      expect(@hourly_weather.get_wind_direction(300)).to eq("WNW")
      expect(@hourly_weather.get_wind_direction(310)).to eq("NW")
      expect(@hourly_weather.get_wind_direction(330)).to eq("NNW")
      expect(@hourly_weather.get_wind_direction(359)).to eq("N")
      expect(@hourly_weather.get_wind_direction(500)).to eq("No wind direction found")
    end
  end
end 