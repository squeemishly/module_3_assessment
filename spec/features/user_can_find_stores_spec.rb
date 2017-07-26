require 'rails_helper'

RSpec.describe "a user can search for a store" do
  context "from the search box" do
    it "when they fill in the zipcode" do
      visit '/'
      save_and_open_page

      fill_in "find a store", with: "80202"
      click_on ".btn-search"

      expect(current_path).to eq "/search"

      expect(page).to have_content "17 Total Stores"

      within(".store-info") do
        expect(page).to have_selector(".long-name")
        expect(page).to have_selector(".city")
        expect(page).to have_selector(".distance")
        expect(page).to have_selector(".phone-number")
        expect(page).to have_selector(".store-type")
      end
    end
  end
end

# ### 2. Consume Best Buy's API
#
# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
