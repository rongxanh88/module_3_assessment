require "rails_helper"

RSpec.describe "Items API", :type => :request do
  it "returns a 200 response with all items" do
    create(:item)
    create(:item, name: 'Firebolt')
    create(:item, name: 'Thunder')

    get '/api/v1/items'

    result = JSON.parse(repsponse.body)

    expect(response).to have_http_status(200)
  end
end
# And each item has an id, name, description, and image_url but not the created_at or updated_at
