require "rails_helper"

RSpec.describe "Items API", :type => :request do
  it "returns a 204 response with item deleted" do
    skip
    item = create(:item)

    delete "/api/v1/items/#{item.id}"

    result = JSON.parse(response.body)

    expect(response).to have_http_status(204)
  end
end