class ImageFacade
  class << self 
    def grab_image(city)
      photo = Unsplash::Photo.search(city, page = 1, per_page = 1)
      results = Photo.new(photo.to_a[0].to_h, city)
    end
  end
end