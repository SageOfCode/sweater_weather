class LocationFacade
  class << self 
    def get_coords(city)
      data = LocationService.get_coords_of_city(city)
      Location.new(data)
    end
  end
end 