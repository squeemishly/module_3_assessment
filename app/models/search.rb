class Search
  def self.find_stores
    StoreFinder.find_stores
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=city,longName,distance,phone,storeType&apiKey=#{ENV['best_buy_api_key']}")
    # JSON.parse(response.body, symbolize_names: true)
  end

  def self.make_stores
    self.find_stores[:stores].map do |store|
      Store.new(store)
    end
  end
end
