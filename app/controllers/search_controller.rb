class SearchController < ApplicationController
  def index
    #works in the browser, but params zip doesn't work in test. not sure why. neither does josh. hardcoding to continue the test.
    # @stores = Search.find_stores
    @store_count = Search.find_stores[:total]
    @stores = Search.make_stores
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=city,longName,distance,phone,storeType&apiKey=#{ENV['best_buy_api_key']}")
    # @stores = JSON.parse(response.body, symbolize_names: true)
    # @stores = info[:stores]
  end
end
