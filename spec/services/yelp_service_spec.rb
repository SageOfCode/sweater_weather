require 'rails_helper'

describe YelpService do
  context "class methods" do
    context ".get_food_data" do
      it "returns results" do
        query = YelpService.get_food_data("chinese", "boulder,co")
        
        expect(query).to be_a Hash

        yelp_data = query
        expect(yelp_data).to have_key :businesses
        expect(yelp_data[:businesses]).to be_a(Array)
        
        food_data = yelp_data[:businesses][0]
        expect(food_data).to have_key :name
        expect(food_data[:name]).to be_a(String)
       
        expect(food_data).to have_key :is_closed
        expect(food_data).to have_key :location
        expect(food_data[:location]).to be_a(Hash)

        address_data = food_data[:location]
        expect(address_data).to have_key :display_address
        expect(address_data[:display_address]).to be_a(Array)
        expect(address_data[:display_address][0]).to be_a(String)
      end
    end
  end
end
