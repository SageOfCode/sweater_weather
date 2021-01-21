require 'rails_helper'

describe LocationService do
  context "class methods" do
    context ".get_coords_of_city" do
      it "returns results" do
        query = LocationService.get_coords_of_city("denver,co")
        
        expect(query).to be_a Hash
        location_data = query[:results][0][:locations][0]
        
        expect(location_data).to have_key :latLng
        expect(location_data[:latLng]).to be_a(Hash)
        
        lat_long_data = location_data[:latLng]
        expect(lat_long_data).to have_key :lat
        expect(lat_long_data[:lat]).to be_a(Numeric)

        expect(lat_long_data).to have_key :lng
        expect(lat_long_data[:lng]).to be_a(Numeric)
      end
    end
    context ".get_trip_distance" do
      it "returns results" do
        query = LocationService.get_trip_distance("denver,co", "boulder,co")

        expect(query).to be_a Hash
        distance_data = query[:route]

        expect(distance_data).to have_key :distance
        expect(distance_data[:distance]).to be_a(Numeric)

        expect(distance_data).to have_key :formattedTime
        expect(distance_data[:formattedTime]).to be_a(String)
      end
    end
  end
end
