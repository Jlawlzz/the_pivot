require 'rails_helper'

RSpec.feature "visitor can view auctions" do
  scenario "index displays all current auctions for visitor" do

    humans = create_list(:human, 30)

    30.times do |t|
      Auction.create(human_id: humans[t].id)
    end

    business = create(:business)

    visit '/'

    expect(page).to have_link("View Businesses")
    expect(page).to have_link("View Humans for Hire")

    click_link "View Humans for Hire"

    expect(current_path).to eq auctions_path

    30.times do |t|
      expect(page).to have_content(humans[t].scum_name)
      expect(page).to have_content(humans[t].bio)
    end
  end
end
