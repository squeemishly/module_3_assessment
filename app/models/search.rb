class Search
  def self.find_stores
    StoreFinder.find_stores
  end

  def self.make_stores
    self.find_stores[:stores].map do |store|
      Store.new(store)
    end
  end
end
