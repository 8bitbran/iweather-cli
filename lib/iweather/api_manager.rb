class IWeather::APIManager

    BASE_URL = 'http://api.weatherapi.com/v1/current.json?key=c22e4f5d01cd4f18b1b232400202504'

    def self.get_weather(zipcode)
        response = HTTParty.get("#{BASE_URL}&q=#{zipcode}")
        if response.include?(["error"])
            puts "Please enter a valid 5 digit zip code"
        else 
            IWeather::Weather.create_from_api(response)
        end 
    end

end