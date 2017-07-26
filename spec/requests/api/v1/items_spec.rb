require 'rails_helper'

RSpec.describe "Items API" do
  it "can send a list of all items" do
    create_list(:item, 5)

    get '/api/v1/items'

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq 5
    expect(items.first["id"]).to be_a Integer
    expect(items.first["name"]).to be_a String
    expect(items.first["description"]).to be_a String
    expect(items.first["image_url"]).to be_a String
    expect(items.first["created_at"]).to be nil
    expect(items.first["updated_at"]).to be nil
  end

  it "can send an item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    info = JSON.parse(response.body)

    expect(response).to be_success
    expect(info["id"]).to eq item.id
    expect(info["name"]).to eq item.name
    expect(info["description"]).to eq item.description
    expect(info["image_url"]).to eq item.image_url
    expect(info["created_at"]).to be nil
    expect(info["updated_at"]).to be nil
  end

  it "can delete an item" do
    item = create(:item)
    expect(Item.count).to eq 1

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_success
    expect(response.status).to eq 204
    expect(Item.count).to eq 0
  end
end
# ```### 1. Create an API
#
# For this challenge clone [Storedom](https://github.com/turingschool-examples/storedom).
#
# We need an API for the application that can both read and write data. Start by focusing on functionality for items. All of this should happen in a dedicated, versioned controller.
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# * Verify that your non-GET requests work using Postman or curl. (Hint: `ActionController::API`). Why doesn't the default `ApplicationController` support POST and PUT requests?
# ```
