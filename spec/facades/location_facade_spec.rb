require 'rails_helper'

describe LocationFacade do
  context "class methods" do
    context ".grab_image" do
      it "returns image data" do
        location = LocationFacade.get_coords("denver,co")
       
        expect(location).to be_a(Location)
        expect(location.lat).to be_a(Numeric)
        expect(location.lng).to be_a(Numeric)
      end
    end
  end
end