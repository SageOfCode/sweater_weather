class Munchie
  def initialize(city, distance, forecast, food)
    require 'pry'; binding.pry
    @destination_city = city.gsub(",", ", ").capitalize
    @travel_time = distance[:route][:formattedTime]
  end
end