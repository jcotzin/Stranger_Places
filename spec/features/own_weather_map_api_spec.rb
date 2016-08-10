require 'rails_helper'

RSpec.describe OpenWeatherMapApi, type: :feature do
  subject { described_class }

  it "converts 0K into -459.67F (rounded to -460F)" do
    kelvin = 0
    fahrenheit = subject.kelvin_to_fahrenheit(kelvin)
    expect(fahrenheit).to eq(-460)
  end

  it "converts 500K into 440.33F" do
    kelvin = 500
    fahrenheit = subject.kelvin_to_fahrenheit(kelvin)
    expect(fahrenheit).to eq(440)

  end


  it "gets the weather for miami" do
    weather = OpenWeatherMapApi.get_weather("miami")
    expect(weather).to_not be_nil

    coords = weather["coord"]
    expect(coords['lon']).to eq(-80.19)
    expect(coords['lat']).to eq(25.77)
  end
end
