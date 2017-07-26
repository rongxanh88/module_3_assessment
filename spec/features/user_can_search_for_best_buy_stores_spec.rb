require "rails_helper"

RSpec.feature "View Best Buy Stores", :type => :feature do
  scenario "user searches for best buy stores within 25 miles" do
    visit "/"

    fill_in "zip_code", with: "80202"
    click_on "Search"

    expect(page).to have_content('17 Total Stores')
    #first store
    expect(page).to have_content('Long Name: BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER')
    expect(page).to have_content('City: Denver')
    expect(page).to have_content('Phone Number: 303-270-9189')
    expect(page).to have_content('Store Type: Mobile SAS')

    #10th store
    expect(page).to have_content('Long Name: BEST BUY - SOUTHGLENN')
    expect(page).to have_content('City: Centennial')
    expect(page).to have_content('istance: 11.02')
    expect(page).to have_content('Store Type: Big Box')
  end
end