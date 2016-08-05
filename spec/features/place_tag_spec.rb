require 'rails_helper'

describe PlaceTag, :type => :model  do

    it "has a place id" do
    peru = Place.create!(name: "Machu Pichu", description: 'Sunny', latitude: 80, longitude: -25, city: "Lima", state_province: "FL", country: "Peru")
    adventure = Tag.create!(name: 'adventure')
    place_tag = PlaceTag.create!(place: peru, tag: adventure)

    expect(place_tag).to be_a(PlaceTag)
    expect(place_tag.place).to eq(peru)
    expect(place_tag.tag).to eq(adventure)
  end
end
