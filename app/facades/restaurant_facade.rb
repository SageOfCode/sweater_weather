class RestaurantFacade
  class << self
    def restaurant_data(food_type, location)
      FoodService.get_food_data(food_type, location)
    end

    def create_munchie_obj(start, destination, food)
      distance_data = LocationFacade.get_distance(start, destination)
      forecast_data = WeatherFacade.get_food_weather(distance_data[:route][:boundingBox][:lr][:lat], distance_data[:route][:boundingBox][:lr][:lng])
      # arrival_time = arrive_time(distance_data)
      restaurant_data = restaurant_data(food, destination)

      Munchie.new(destination, distance_data, forecast_data, restaurant_data)
    end

    def arrive_time(distance_data)
      Time.parse(distance_data[:route][:formattedTime]).min + Time.now
    end
  end 
end