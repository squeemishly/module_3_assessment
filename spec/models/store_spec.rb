require 'rails_helper'

RSpec.describe Store do
  it "has attributes" do
    VCR.use_cassette("Store_has_attributes") do
      store = Search.make_stores.first

      expect(store.city).to be_a String
      expect(store.long_name).to be_a String
      expect(store.phone).to be_a String
      expect(store.store_type).to be_a String
      expect(store.distance).to be_a Float
    end
  end
end
