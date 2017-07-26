require "rails_helper"

RSpec.describe "Item API", :type => :request do
  it "returns a 200 response with a single items" do
    skip
    item = create(:item)

    get "/api/v1/item/#{item.id}"

    result = JSON.parse(response.body)

    expect(response).to have_http_status(200)
  end
end
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at