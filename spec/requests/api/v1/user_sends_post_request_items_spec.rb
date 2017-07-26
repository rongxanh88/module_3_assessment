require "rails_helper"

RSpec.describe "Items API", :type => :request do
  it "returns a 201 response and creates an item" do
    skip
    attributes = attributes_for(:item)
    post '/api/v1/items', item: attributes

    result = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(response).to have_http_status(201)
  end
end