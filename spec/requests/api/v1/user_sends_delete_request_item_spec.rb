require "rails_helper"

RSpec.describe "Items API", :type => :request do
  it "returns a 204 response with item deleted" do
    item = create(:item)

    delete "/api/v1/items/#{item.id}"

    expect(response).to have_http_status(204)
    expect(Item.count).to eq(0)
  end
end