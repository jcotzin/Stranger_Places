require 'rails_helper'

RSpec.feature "user registration", type: :feature, js: true do
   it "should be able to register the user " do
     visit("/")
     click_link("Login")
     click_link("Sign up")
     fill_in("Username", :with => "Jessica01")
     fill_in("Email Address", :with => "Jessica01@example.com")
     fill_in("Password", :with => "12345")
     fill_in("Confirm Password", :with => "12345")
     click_button("Register Now")
     expect(page).to have_content("Log Out")
   end
   it "should be able to detect if user has put in incorrect password" do
    #  visit("/")
    #  click_link("Login")
    #  click_button("Sign up")
    #  fill_in("Password", :with => "1234556")

   end

end
