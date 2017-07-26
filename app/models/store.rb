class Store
  attr_reader :city, :long_name, :distance, :phone, :store_type

  def initialize(store_info)
    @city = store_info[:city]
    @long_name = store_info[:longName]
    @distance = store_info[:distance]
    @phone = store_info[:phone]
    @store_type = store_info[:storeType]
  end
end
