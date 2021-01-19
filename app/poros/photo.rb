class Photo
  attr_reader :image_url,
              :location,
              :credit

  def initialize(photo_data, city)
    @image_url = photo_data[:urls]['full']
    @location = city
    @credit = {author: photo_data[:user]['username'], 
               author_url: photo_data[:user]['links']['self'],
               source: 'unsplash.com'}
  end
end