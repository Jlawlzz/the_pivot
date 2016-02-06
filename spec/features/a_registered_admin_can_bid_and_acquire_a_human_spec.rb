require 'rails_helper'

RSpec.feature "admin can bid and acquire human" do
  scenario "admin can bid on a human" do

    human = create(:human)
    auction = Auction.create(human_id: human.id)
    business = create(:business)

    admin = User.create(first_name: "jordan",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    business.users << admin

    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit admin_dashboard_path

    within("#bid") do
      click_on "Bid for #{business.name}"
    end

    expect(current_path).to eq auctions_path
    save_and_open_page
    click_on "Bid Now!"

    expect(current_path).to eq auctions_path(auction)

    expect(page).to have_content(human.scum_name)
    expect(page).to have_content(human.bio)

    within("##{auction.id}_bid") do
      expect(page).to have_content("Current Bid: $0")
      expect(page).to have_button("Bid Now")
      fill_in "Amount", with: "1000"
      click_on "Bid Now"
    end

    expect(Bid.all.count).to eq 1
    expect(Bid.first.amount).to eq "1000"

    expect(current_path).to eq auctions_path(auction)
    expect(page).to have_content("Current Bid: $1000")
  end
end
