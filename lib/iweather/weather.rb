class IWeather::Weather

    @@all = []

    # returns all Forecast objects
    def self.all 
        @@all
    end 

    # instantiates and saves new Forecast objects
    def self.create_from_api(weather)
        location = "#{weather["location"]["name"]}, #{weather["location"]["region"]}, #{weather["location"]["country"]}"
        date = weather["location"]["localtime"].split(" ")[0]
        time = weather["location"]["localtime"].split(" ")[1]
        temp = weather["current"]["temp_f"]
        wind = weather["current"]["wind_mph"]
        humidity = weather["current"]["humidity"]
        precip = weather["current"]["precip_in"]
        condition = weather["current"]["condition"]["text"]
        new(location, date, time, temp, wind, humidity, precip, condition).save
    end 

    attr_reader :location, :date, :time, :temp, :wind, :humidity, :precip, :condition

    # instantiates a new Forecast objects
    def initialize(location, date, time, temp, wind, humidity, precip, condition)
        @location = location
        @date = date
        @time = time
        @temp = temp 
        @wind = wind 
        @humidity = humidity 
        @precip = precip 
        @condition = condition
    end 

    def weather_info
        @location
        @date
        @time
        @temp 
        @wind 
        @humidity 
        @precip 
        @condition
    end

    # pushes Forecast objects into class array '@@all'
    def save 
        @@all << self
    end 

end

binding.pry
