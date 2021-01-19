class RestaurantFacade
  def self.restaurant_data(food_type, location)
    YelpService.get_food_data(food_type, location)
  end

  def self.create_munchie_obj(start, destination, food)
    distance_data = LocationFacade.get_distance(start, destination)
    forecast_data = WeatherFacade.get_food_weather(distance_data[:route][:boundingBox][:lr][:lat], distance_data[:route][:boundingBox][:lr][:lng])
    restaurant_data = restaurant_data(food, destination)

    Munchie.new(destination, distance_data, forecast_data, restaurant_data)
  end
end