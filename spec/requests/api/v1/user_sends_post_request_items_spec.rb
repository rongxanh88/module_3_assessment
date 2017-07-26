require "rails_helper"

RSpec.describe "Items API", :type => :request do
  it "returns a 201 response and creates an item" do
    attributes = attributes_for(:item)
    post '/api/v1/items', item: attributes

    result = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to have_http_status(200)
    expect(result[:name]).to eq(attributes[:name])
    expect(result[:description]).to eq(attributes[:description])
    expect(result[:image_url]).to eq(attributes[:image_url])
    expect(result[:created_at]).to be nil
    expect(result[:updated_at]).to be nil
  end
end