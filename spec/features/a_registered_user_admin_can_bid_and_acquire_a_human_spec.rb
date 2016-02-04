require 'rails_helper'

RSpec.feature "user/admin can bid and acquire human" do
  scenario "user/admin can bid on a human" do

    human = Human.create(attributes_for(:human))
    auction = Auction.create(human_id: human.id)

    visit auction_path(auction)

    expect(page).to have_content(human.scum_name)
    expect(page).to have_content(human.bio)

    within("##{auction.id}_bid") do
      expect(page).to have_content("Current Bid: $0")
      expect(page).to have_button("Bid Now")
    end

    fill_in "Bid Amount", with: "1000"
    click_on "Bid Now"

    expect(Bid.all.count).to eq 1
    expect(Bid.first.amount).to eq "1000"

    expect(current_path).to eq auctions_path(auction)
    expect(page).to have_content("Current Bid: $1000")
  end
end
