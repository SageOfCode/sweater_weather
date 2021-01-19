class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(origin, destination, trip_data, weather_data)
    @start_city = origin
    @end_city = destination
    @travel_time = trip_data[:route][:formattedTime]
    @weather_at_eta = {
      temperature: weather_data[:current][:temp],
      conditions: weather_data[:current][:weather][0][:description]
    }
  end
end