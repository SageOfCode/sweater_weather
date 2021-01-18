class WeatherService
  class << self
    def current_weather(location)
      response = conn.get('/data/2.5/onecall') do |req|
        req.params['lat'] = location.lat
        req.params['lon'] = location.lng
      end
      parse_data(response)
    end

    private 

    def conn
      Faraday.new(url: 'http://api.openweathermap.org') do |req|
        req.params['appid'] = ENV['weather_api_key']
      end
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end 
end
