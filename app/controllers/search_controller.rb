class SearchController < ApplicationController
  def index
    binding.pry
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{params[:zip]},25))?format=json&show=city,longName,distance,phone,storeType&apiKey=#{ENV['best_buy_api_key']}")
    info = JSON.parse(response.body, symbolize_names: true)
    @stores = info[:stores]
  end
end
