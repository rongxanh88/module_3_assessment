require "rails_helper"

RSpec.feature "View Best Buy Stores", :type => :feature do
  scenario "user searches for best buy stores within 25 miles" do
    visit "/"

    fill_in "zip_code", with: "80202"
    click_on "Search"

    # expect(page).to have_content('17 Total Stores')
    #first store
    expect(page).to have_content('Long Name: Cherry Creek Shopping Center')
    expect(page).to have_content('City: Denver')
    expect(page).to have_content('Phone Number: 303-270-9189')
    expect(page).to have_content('Store Type: Mobile SAS')

    #10th store
    expect(page).to have_content('Long Name: Southglenn')
    expect(page).to have_content('City: Centennial')
    expect(page).to have_content('istance: 11.02')
    expect(page).to have_content('Store Type: Big Box')
  end
end

# And I should see pagination links below the search results for the number of pages (2 in this case)
# And `1` is my current page but isn't a clickable link
# And `2` is a clickable link
# When I click `2`
# Then I should be taken to the next page of search results
# Then my current path should be "/search" (ignoring params)
# And in the params I should see `page=2`
# And I should see stores within 25 miles
# And I should see a message that says "17 Total Stores"
# And I should see the next 6 results
# And I should see the long name, city, distance, phone number and store type for each of the next 6 results