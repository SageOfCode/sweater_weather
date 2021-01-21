require 'rails_helper'

describe RestaurantFacade do
  context "class methods" do
    context ".grab_image" do
      it "returns image data" do
        restaurant = RestaurantFacade.restaurant_data("mexican", "boulder,co")
    
        expect(restaurant).to be_a(Hash)
        business_data = restaurant[:businesses][0]
        expect(business_data).to have_key(:name)
        expect(business_data[:name]).to be_a(String)
      end
    end
    context ".create_munchie_obj" do
      it "returns munchie object" do
        munchie = RestaurantFacade.create_munchie_obj("denver,co", "pueblo,co", "mexican")

        expect(munchie).to be_a(Munchie)
        expect(munchie.destination_city).to be_a(String)
        expect(munchie.forecast).to be_a(Hash)
        expect(munchie.restaurant).to be_a(Hash)
        expect(munchie.travel_time).to be_a(String)
      end 
    end
  end
end