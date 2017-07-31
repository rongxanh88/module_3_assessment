require "rails_helper"

RSpec.describe "Sends api call to Best Buy" do
  scenario "search for stores within 25 miles of 80202" do
    stores = BestBuyService.get_stores("80202")
    
    expect(stores.count).to eq(17)
  end
end