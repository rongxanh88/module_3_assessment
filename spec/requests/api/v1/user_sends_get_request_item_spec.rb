require "rails_helper"

RSpec.describe "Item API", :type => :request do
  it "returns a 200 response with a single items" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"
    
    result = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to have_http_status(200)
    expect(result[:id]).to eq(item.id)
    expect(result[:name]).to eq(item.name)
    expect(result[:description]).to eq(item.description)
    expect(result[:image_url]).to eq(item.image_url)
    expect(result[:created_at]).to be nil
    expect(result[:updated_at]).to be nil
  end
end