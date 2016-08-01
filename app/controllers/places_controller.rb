require 'httparty'
class PlacesController < ApplicationController
  def index
    #using openweather api
  @today = Date.today
  @response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=miami&APPID=612104db0b85a84d80dd7cd48d5516c9')
  @parsed = @response.parsed_response
  @description = @response.parsed_response["weather"][0]["description"]
  @temp = @parsed["main"]["temp"]
  @fahrenheit = @temp * 1.8
  @degrees = (@fahrenheit - 459.67).round

  #clear sky, few clouds, scattered clouds, broken clouds, shower rain, rain, thunderstorm, snow, mist
  
  end
end
