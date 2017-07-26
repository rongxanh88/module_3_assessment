require "rails_helper"

RSpec.describe "Items API", :type => :request do
  it "returns a 201 response and creates an item" do
    skip
    attributes = attributes_for(:item)
    post '/api/v1/items', params: {name: attributes[:name], description: attributes[:description], image_url: attributes[:image_url]}

    result = JSON.parse(response.body)

    expect(response).to have_http_status(201)
  end
end
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at