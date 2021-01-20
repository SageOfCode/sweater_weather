require 'rails_helper'
describe 'RoadTrip' do
  it 'exists and has attributes' do

    origin = "Denver,CO"
    destination = "Pueblo,CO"
    trip_data = {
      :route=>
        {:hasTollRoad=>false,
        :hasBridge=>true,
        :boundingBox=>{:lr=>{:lng=>-104.605087, :lat=>38.265427}, :ul=>{:lng=>-104.98761, :lat=>39.738453}},
        :distance=>111.38,
        :hasTimedRestriction=>false,
        :hasTunnel=>false,
        :hasHighway=>true,
        :computedWaypoints=>[],
        :routeError=>{:errorCode=>-400, :message=>""},
        :formattedTime=>"01:44:22",
        :sessionId=>"6007b385-018a-5f21-02b4-3300-0a10803a4a73",
        :hasAccessRestriction=>false,
        :realTime=>6648,
        :hasSeasonalClosure=>false,
        :hasCountryCross=>false,
        :fuelUsed=>5.5}
    }
    weather_data = {
      :dt=>1611122400,
      :temp=>26.11,
      :feels_like=>20.52,
      :pressure=>1029,
      :humidity=>90,
      :dew_point=>23.88,
      :uvi=>0,
      :clouds=>0,
      :visibility=>10000,
      :wind_speed=>1.7,
      :wind_deg=>210,
      :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
      :pop=>0
    }


    road_trip = RoadTrip.new(origin, destination, trip_data, weather_data)
  
    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.start_city).to eq(origin.sub(",", ", ").titleize)
    expect(road_trip.end_city).to eq(destination.sub(",", ", ").titleize)
    expect(road_trip.travel_time).to eq(trip_data[:route][:formattedTime])

    expected = {  
                temperature: weather_data[:temp],
                conditions: weather_data[:weather][0][:description]
              }
    expect(road_trip.weather_at_eta).to eq(expected)
  end
end 