require 'rails_helper'

RSpec.describe StoreFinder do
  context "methods" do
    it ".find_stores" do
      VCR.use_cassette("StoreFinder_class_method_find_stores") do
        info = StoreFinder.find_stores

        expect(info[:total]).to be_a Integer
        expect(info[:stores].first[:city]).to be_a String
        expect(info[:stores].first[:longName]).to be_a String
        expect(info[:stores].first[:distance]).to be_a Float
        expect(info[:stores].first[:phone]).to be_a String
        expect(info[:stores].first[:storeType]).to be_a String

      end
    end

    it "#find_stores" do
      VCR.use_cassette("StoreFinder_instance_method_find_stores") do
        info = StoreFinder.new.find_stores

        expect(info[:total]).to be_a Integer
        expect(info[:stores].first[:city]).to be_a String
        expect(info[:stores].first[:longName]).to be_a String
        expect(info[:stores].first[:distance]).to be_a Float
        expect(info[:stores].first[:phone]).to be_a String
        expect(info[:stores].first[:storeType]).to be_a String
      end

    end
  end
end
