require 'rails_helper'

RSpec.describe "Road Trip endpoints" do
  describe "can get forecast and info for destination" do 
    it "returns endpoints for destination info" do
      
      User.create!(
        email: 'whatever@example.com',
        password: 'password',
        api_key: "jgn983hy48thw9begh98h4539h4"
                    )

      query_params = {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "api_key": "jgn983hy48thw9begh98h4539h4"
                      }
      post "/api/v1/road_trip", params: query_params
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      roadtrip_response = JSON.parse(response.body, symbolize_names: true)
      expect(roadtrip_response).to be_a(Hash)
      expect(roadtrip_response).to have_key(:data)
      expect(roadtrip_response[:data]).to be_a(Hash)
      expect(roadtrip_response[:data]).to have_key(:id)
      expect(roadtrip_response[:data][:id]).to eq(nil)
      expect(roadtrip_response[:data]).to have_key(:type)
      expect(roadtrip_response[:data][:type]).to eq('roadtrip')
      expect(roadtrip_response[:data]).to have_key(:attributes)
      expect(roadtrip_response[:data][:attributes]).to be_a(Hash)

      roadtrip_info = roadtrip_response[:data][:attributes]
      expect(roadtrip_info).to have_key(:start_city)
      expect(roadtrip_info[:start_city]).to be_a(String)
      expect(roadtrip_info).to have_key(:end_city)
      expect(roadtrip_info[:end_city]).to be_a(String)
      expect(roadtrip_info).to have_key(:end_city)
      expect(roadtrip_info[:end_city]).to be_a(String)
      expect(roadtrip_info).to have_key(:travel_time)
      expect(roadtrip_info[:travel_time]).to be_a(String)
      expect(roadtrip_info).to have_key(:weather_at_eta)
      expect(roadtrip_info[:weather_at_eta]).to be_a(Hash)

      weather_data = roadtrip_response[:data][:attributes][:weather_at_eta]
      expect(weather_data).to have_key(:temperature)
      expect(weather_data[:temperature]).to be_a(Numeric)
      expect(weather_data).to have_key(:conditions)
      expect(weather_data[:conditions]).to be_a(String)
    end
  end
end