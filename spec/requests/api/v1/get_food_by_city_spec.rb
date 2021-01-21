require 'rails_helper'

RSpec.describe "Food and forecast endpoints" do
  describe "can get response from location" do 
    it "sends a food with forecast response" do

      query_params = {
          start:        'denver,co',
          destination:  'pueblo,co',
          food:         'chinese'
                  }
      get "/api/v1/munchies", params: query_params
    
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      munchies_response = JSON.parse(response.body, symbolize_names: true)
      expect(munchies_response).to be_a(Hash)
      expect(munchies_response).to have_key(:data)
      expect(munchies_response[:data]).to be_a(Hash)
      expect(munchies_response[:data]).to have_key(:id)
      expect(munchies_response[:data][:id]).to eq(nil)
      expect(munchies_response[:data]).to have_key(:type)
      expect(munchies_response[:data][:type]).to eq('munchie')
      expect(munchies_response[:data]).to have_key(:attributes)
      expect(munchies_response[:data][:attributes]).to be_a(Hash)

      munchie_details = munchies_response[:data][:attributes]
      expect(munchie_details).to be_a(Hash)
      expect(munchie_details).to have_key(:destination_city)
      expect(munchie_details[:destination_city]).to be_a(String)
      expect(munchie_details).to have_key(:travel_time)
      expect(munchie_details[:travel_time]).to be_a(String)
      expect(munchie_details).to have_key(:forecast)
      expect(munchie_details[:forecast]).to be_a(Hash)
      expect(munchie_details).to have_key(:restaurant)
      expect(munchie_details[:restaurant]).to be_a(Hash)

      forecast_details = munchie_details[:forecast]
      expect(forecast_details).to have_key(:summary)
      expect(forecast_details[:summary]).to be_a(String)
      expect(forecast_details).to have_key(:temperature)
      expect(forecast_details[:temperature]).to be_a(String)
    

      restaurant_details = munchie_details[:restaurant]
      expect(restaurant_details).to have_key(:name)
      expect(restaurant_details[:name]).to be_a(String)
      expect(restaurant_details).to have_key(:address)
      expect(restaurant_details[:address]).to be_a(String)
    end
  end 
end 
    