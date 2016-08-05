
require 'rspec'

RSpec.describe Tags, :type => :model do
  peru = Place.create!(name: "Machu Pichu")
  it "should have mulitple tags for one place" do
    page.should have_content("tag")
  end
end
