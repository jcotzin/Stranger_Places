require 'httparty'
class PlacesController < ApplicationController
  def index
    @user = User.new
    @places = Place.all

    #clear sky, few clouds, scattered clouds, broken clouds, shower rain, rain, thunderstorm, snow, mist
  end

  def city
    #using openweather api
    response = []
    unless params[:data].empty?
      params[:data].each do |id|
        place = Place.find(id)
        city = place.city
        weather = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=612104db0b85a84d80dd7cd48d5516c9")
        parsed = weather.parsed_response
        temp = parsed["main"]["temp"]
        fahrenheit = temp * 1.8

        response <<  {
          description: parsed["weather"][0]["description"],
          degrees: (fahrenheit - 459.67).round
        }
        # sleep(1);
      end
    end
    p "++++++++++++++++++++++++++"
    p response
    # @parsed = @response.parsed_response
    # @description = @response.parsed_response["weather"][0]["description"]
    # @temp = @parsed["main"]["temp"]
    # @fahrenheit = @temp * 1.8
    # @degrees = (@fahrenheit - 459.67).round
    p "+++++++++++++++++++++++++++"
    render json: response

  end

  def create
    # @place = Place.new(place_params)

    # if @place.save
    #   session[:place_id] = @place.id
    #   redirect_to '/'
    #
    # end
  end

  def api
    @places = Place.all
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :latitude, :longitude, :city, :state_province, :country, :airport, :main_img)
  end
end
