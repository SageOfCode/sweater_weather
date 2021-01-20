require 'rails_helper'

describe RoadtripFacade do
  context "class methods" do
    context ".grab_image" do
      it "returns image data" do
        road_trip = RoadtripFacade.get_road_trip_data("denver,co", "aspen,co")
       
        expect(road_trip).to be_a(RoadTrip)
        expect(road_trip.start_city).to be_a(String)
        expect(road_trip.end_city).to be_a(String)
        expect(road_trip.travel_time).to be_a(String)
        expect(road_trip.weather_at_eta).to be_a(Hash)

        weather_at_arrival = road_trip.weather_at_eta
        expect(weather_at_arrival).to have_key :temperature
        expect(weather_at_arrival[:temperature]).to be_a(Numeric)
        expect(weather_at_arrival).to have_key :conditions
        expect(weather_at_arrival[:conditions]).to be_a(String)
      end
    end
  end
end