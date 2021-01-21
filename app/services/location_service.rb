class LocationService
  class << self 
    def get_coords_of_city(city)
      response = conn.get("/geocoding/v1/address") do |r|
        r.params['location'] = city
      end
      parse_data(response)
    end

    def get_trip_distance(origin, destination)
      response = conn.get("/directions/v2/route") do |r|
        r.params['from'] = origin
        r.params['to'] = destination
      end 
      parse_data(response)
    end

    private
    def conn
      Faraday.new("http://www.mapquestapi.com") do |f|
        f.params['key'] = ENV['map_api_key']
      end
    end 

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end 
end