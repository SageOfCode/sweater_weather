class RoadtripFacade
  class << self 
    def get_road_trip_data(origin, destination)
      trip_data = LocationService.get_trip_distance(origin, destination)
      weather_data = WeatherService.weather_forecast(trip_data[:route][:boundingBox][:lr][:lat], trip_data[:route][:boundingBox][:lr][:lng])
      RoadTrip.new(origin, destination, trip_data, weather_data)
    end
  end 
end
