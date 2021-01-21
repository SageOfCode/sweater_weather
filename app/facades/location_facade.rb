class LocationFacade
  class << self 
    def get_coords(city)
      data = LocationService.get_coords_of_city(city)
      Location.new(data)
    end

    def get_distance(start, destination)
      LocationService.get_trip_distance(start, destination)
    end
  end
end 