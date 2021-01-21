class RoadtripFacade
  class << self 
    def get_road_trip_data(origin, destination)
      trip_data = LocationService.get_trip_distance(origin, destination)
      trip_time = trip_duration(trip_data[:route][:formattedTime])
      weather_data = WeatherService.weather_forecast(trip_data[:route][:boundingBox][:lr][:lat], trip_data[:route][:boundingBox][:lr][:lng])
      weather_at_arrival_time = weather_data[:hourly][trip_time]

      RoadTrip.new(origin, destination, trip_data, weather_at_arrival_time)
    end

    def trip_duration(trip_time)
      if Time.parse(trip_time).min < 30
        Time.parse(trip_time).hour
      else
        Time.parse(trip_time).hour + 1
      end
    end
  end 
end
