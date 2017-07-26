require "rails_helper"

RSpec.feature "View Best Buy Stores", :type => :feature do
  scenario "user searches for best buy stores within 25 miles" do
    visit "/"

    fill_in "zip_code", with: "80202"
    click_on "Search"

    expect(page).to have_current_path('/search')
    expect(page).to have_content('17 Total Stores')
    #see 10 results
    #see long name, city, distance, phone number, store type
  end
end