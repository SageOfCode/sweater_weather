require 'rails_helper'

RSpec.describe "Image endpoints" do
  describe "can get image from location" do 
    it "sends image info" do

      query_params = {
          location: 'denver,co'
          }
      get "/api/v1/backgrounds", params: query_params
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      image_response = JSON.parse(response.body, symbolize_names: true)
      expect(image_response).to be_a(Hash)
      expect(image_response).to have_key(:data)
      expect(image_response[:data]).to be_a(Hash)
      expect(image_response[:data]).to have_key(:id)
      expect(image_response[:data][:id]).to eq(nil)
      expect(image_response[:data]).to have_key(:type)
      expect(image_response[:data][:type]).to eq('image')
      expect(image_response[:data]).to have_key(:attributes)
      expect(image_response[:data][:attributes]).to be_a(Hash)

      image_details = image_response[:data][:attributes]
      expect(image_details).to have_key(:image_url)
      expect(image_details[:image_url]).to be_a(String)
      expect(image_details).to have_key(:location)
      expect(image_details[:location]).to be_a(String)
      expect(image_details).to have_key(:credit)
      expect(image_details[:credit]).to be_a(Hash)

      credit = image_details[:credit]
      expect(credit).to have_key(:author)
      expect(credit[:author]).to be_a(String)
      expect(credit).to have_key(:author_url)
      expect(credit[:author_url]).to be_a(String)
      expect(credit).to have_key(:source)
      expect(credit[:source]).to be_a(String)
    end
    it 'returns a 400 error if nothing is passed in' do 
      query_params  = {
          location: ''
      }
      post "/api/v1/users", params: query_params
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end