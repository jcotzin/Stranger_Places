require 'httparty'
class PlacesController < ApplicationController
  def index
    @user = User.new
    @places = Place.all
    @favorites = current_user.places if current_user
  end

  def city
    #using openweather api
    response = []
    unless params[:data].empty?
      cities = Place.where(id: params[:data]).pluck(:city);
      cities.each do |city|
        weather = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=612104db0b85a84d80dd7cd48d5516c9").parsed_response
        kelvin = weather["main"]["temp"]
        fahrenheit = ((kelvin * 1.8) - 459.67).round

        response <<  {
          description: to_weather_gif(weather["weather"][0]["description"]),
          degrees: fahrenheit
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
# clear sky, few clouds, scattered clouds, broken clouds, shower rain, rain, thunderstorm, snow, mist
  def to_weather_gif(description)
    case description
    when "clear sky"
      helpers.image_tag('sunny.gif')
    when "few clouds"
      helpers.image_tag('cloudy.gif')
    when "scattered clouds"
      helpers.image_tag('overcast.gif')
    when "shower rain"
      helpers.image_tag('sunny.gif')
    when "rain"
      helpers.image_tag('windy.gif')
    when "thunderstorm"
      helpers.image_tag('thunder.gif')
    when "snow"
      helpers.image_tag('snow.gif')
    when "broken clouds"
      helpers.image_tag('overcast.gif')
    end
  end
end
