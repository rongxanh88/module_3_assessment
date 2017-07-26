require "rails_helper"

RSpec.describe "Items API", :type => :request do
  it "returns a 200 response with all items" do
    create(:item)
    create(:item, name: 'Firebolt')
    create(:item, name: 'Thunder', description: 'Magic Broom', image_url: 'fake_url.img')

    get '/api/v1/items.json'
    result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(200)
    expect(result[:items].last[:name]).to eq('Thunder')
    expect(result[:items].last[:description]).to eq('Magic Broom')
    expect(result[:items].last[:image_url]).to eq('fake_url.img')
    expect(result[:items].last[:created_at]).to be nil
    expect(result[:items].last[:updated_at]).to be nil
  end
end