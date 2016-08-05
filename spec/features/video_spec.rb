require 'rails_helper'

RSpec.describe Video, :type => :model do
  it "should have a video button" do
    expect(page).to have_content("button.play")
  end

  it "should be able to detect if video appears on button click" do
    click_button("button.play")
    page.should have_content("video")
  end
end
