require 'rails_helper'

describe ImageFacade do
  context "class methods" do
    context ".grab_image" do
      it "returns image data" do
        photo = Unsplash::Photo.search("denver", page = 1, per_page = 1)
        
        expect(photo).to be_a(Unsplash::SearchResult)
        expect(photo.count).to eq(1)
      end
    end
  end
end