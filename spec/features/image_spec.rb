require 'rails_helper'

describe Image, :type => :model  do
  it "should belong to one place" do
    florida = Place.create!(name: "Disney")
    img_url = Image.create!(img_url:"www.aviationheadsets.net/wp-content/uploads/2015/10/coffee.jpg", place: florida)
    expect(img_url).to be_a(Image)
  end
end
