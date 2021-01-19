class RestaurantFacade
  def self.restaurant_data(food_type, location)
    YelpService.get_food_data(food_type, location)
  end
end