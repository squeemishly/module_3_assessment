require 'rails_helper'

RSpec.describe Search do
  it ".find_stores" do
    VCR.use_cassette("search_can_find_stores") do
      info = Search.find_stores

      expect(info[:total]).to be_a Integer
      expect(info[:stores].first[:city]).to be_a String
      expect(info[:stores].first[:longName]).to be_a String
      expect(info[:stores].first[:distance]).to be_a Float
      expect(info[:stores].first[:phone]).to be_a String
      expect(info[:stores].first[:storeType]).to be_a String
    end
  end

  it ".make_stores" do
    VCR.use_cassette("search_can_make_a_list_of_stores") do
      info = Search.make_stores

      expect(info).to be_a Array
      expect(info.first.city).to be_a String
      expect(info.first.long_name).to be_a String
      expect(info.first.distance).to be_a Float
      expect(info.first.phone).to be_a String
      expect(info.first.store_type).to be_a String
    end
  end
end
