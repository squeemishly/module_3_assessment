class StoreFinder
  def initialize
    @conn = Faraday.new("https://api.bestbuy.com/v1/")
  end

  def self.find_stores
    new.find_stores
  end

  def find_stores
    response = @conn.get("stores(area(80202,25))?format=json&show=city,longName,distance,phone,storeType&apiKey=#{ENV['best_buy_api_key']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
