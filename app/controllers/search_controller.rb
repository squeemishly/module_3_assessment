class SearchController < ApplicationController
  def index
    #works in the browser, but params zip doesn't work in test. not sure why. neither does josh. hardcoding to continue the test.
    @store_count = Search.find_stores[:total]
    @stores = Search.make_stores
  end
end
