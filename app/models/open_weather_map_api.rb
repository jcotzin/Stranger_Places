
class OpenWeatherMapApi
  def self.kelvin_to_fahrenheit(kelvin)
    ((kelvin * 1.8) - 459.67).round
  end

  def self.get_weather(city)
    #using openweather api
     HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=612104db0b85a84d80dd7cd48d5516c9").parsed_response

  end
end
