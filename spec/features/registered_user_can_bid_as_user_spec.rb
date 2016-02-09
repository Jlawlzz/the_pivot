require 'rails_helper'

RSpec.feature "registered user has option to bid as user" do
  scenario "bid option is available" do

    user1 = create(:user)
    b1 = Business.create(name:"Porta Potty", description:"We clean up after nasty humans", url:"www.google.com")
    user1.businesses << b1
    login(user1)

    visit dashboard_path

    within "#user" do
      expect(page).to have_content("Bid")
    end

  end

end
