require 'rails_helper'

describe WeatherService do
  context "class methods" do
    context ".weather_forecast" do
      it "returns results" do
        query = WeatherService.weather_forecast(35.6762, 139.6503)
        
        expect(query).to be_a Hash
        location_data = query[:current]
        
        expect(location_data).to have_key :dt
        expect(location_data[:dt]).to be_a(Numeric)
        
        expect(location_data).to have_key :sunrise
        expect(location_data[:sunrise]).to be_a(Numeric)
        
        expect(location_data).to have_key :sunset
        expect(location_data[:sunset]).to be_a(Numeric)

        expect(location_data).to have_key :temp
        expect(location_data[:temp]).to be_a(Numeric)

        expect(location_data).to have_key :weather
        expect(location_data[:weather]).to be_a(Array)
        expect(location_data[:weather][0]).to be_a(Hash)

        weather_data = location_data[:weather][0]
        expect(weather_data).to have_key :description
        expect(weather_data[:description]).to be_a(String)

        expect(weather_data).to have_key :icon
        expect(weather_data[:icon]).to be_a(String)
      end
    end
  end
end
