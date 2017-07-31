require "rails_helper"

RSpec.describe "Items API", type: :request do
  before(:each) do
    create(:item)
    create(:item, name: 'Firebolt')
    create(:item, name: 'Thunder', description: 'Magic Broom', image_url: 'fake_url.img')
  end

  it "returns a 200 response with all items" do
    get '/api/v1/items.json'
    result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(200)
    expect(result[:items].count).to eq(3)
    expect(result[:items].last[:name]).to eq('Thunder')
    expect(result[:items].last[:description]).to eq('Magic Broom')
    expect(result[:items].last[:image_url]).to eq('fake_url.img')
    expect(result[:items].last[:created_at]).to be nil
    expect(result[:items].last[:updated_at]).to be nil
  end

  it "returns a 200 response with a single item" do
    item = Item.first

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
    expect(Item.count).to eq(4)
  end

  it "returns a 204 response with item deleted" do
    item = Item.first

    delete "/api/v1/items/#{item.id}"

    expect(response).to have_http_status(204)
    expect(Item.count).to eq(2)
  end
end