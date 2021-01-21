require 'rails_helper'

RSpec.describe "User endpoints" do
  describe "can get user info" do 
    it "can return user info upon registration" do

      query_params = {
          "email": "whatever7@example.com",
          "password": "password",
          "password_confirmation": "password"
                      }
      post "/api/v1/users", params: query_params
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")
      
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response).to be_a(Hash)
      expect(user_response).to have_key(:data)
      expect(user_response[:data]).to be_a(Hash)
      expect(user_response[:data]).to have_key(:id)
      expect(user_response[:data][:id]).to be_a(String)
      expect(user_response[:data]).to have_key(:type)
      expect(user_response[:data][:type]).to eq('users')
      expect(user_response[:data]).to have_key(:attributes)
      expect(user_response[:data][:attributes]).to be_a(Hash)

      user_info = user_response[:data][:attributes]
      expect(user_info).to have_key(:email)
      expect(user_info[:email]).to be_a(String)
      expect(user_info).to have_key(:api_key)
      expect(user_info[:api_key]).to be_a(String)
    end
    it 'returns a 401 error if password does not match' do 
      query_params = {
          "email": "whatever1@example.com",
          "password": "password",
          "password_confirmation": "passweird"
                      }
      post "/api/v1/users", params: query_params
      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
    it 'returns a 400 error if email is taken' do 
      User.create!(
        email: 'whatever@example.com',
        password: 'password',
        api_key: "jgn983hy48thw9begh98h4539h4"
                    )
      query_params = {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
                      }
      post "/api/v1/users", params: query_params
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end