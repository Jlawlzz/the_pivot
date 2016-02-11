require 'rails_helper'

RSpec.feature "admin can bid and acquire human" do
  scenario "admin can bid on a human" do
    roles = create_roles
    human = create(:human)
    auction = Auction.create(human_id: human.id)
    business = create(:business, status: "active")
    admin = User.create(first_name: "jordan",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    business.users << admin
    UserRole.create(business_id: business.id, user_id: admin.id, role_id: roles[1].id)
    UserRole.create(user_id: admin.id, role_id: roles[0].id)

    login(admin)

    visit dashboard_path

    within("#bid_partial") do
      click_link "Bid Now"
    end

    expect(current_path).to eq auctions_path

    within("#bid") do
      click_link "Bid Now!"
    end

    expect(current_path).to eq auction_path(auction)

    expect(page).to have_content(human.scum_name)
    expect(page).to have_content(human.bio)

    within("#bid") do
      expect(page).to have_content("Current Bid: $0")
      expect(page).to have_button("Bid Now")
      fill_in "Amount", with: "1000"
      click_on "Bid Now"
    end

    expect(Bid.all.count).to eq 2
    expect(Bid.last.amount).to eq 1000
    expect(page).to have_content "You have succesfully placed a bid of 1000!"
    expect(current_path).to eq auction_path(auction)
    expect(page).to have_content("Current Bid: $1000")
  end

  scenario "business wins bid and admin see human on business dashobaord" do
    roles = create_roles
    human = create(:human)
    auction = Auction.create(human_id: human.id)
    business = create(:business)

    admin = User.create(first_name: "jordan",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    business.users << admin
    UserRole.create(business_id: business.id, user_id: admin.id, role_id: roles[1].id)
    UserRole.create(user_id: admin.id, role_id: roles[0].id)

    login(admin)

    visit auction_path(auction)
    ApplicationController.any_instance.stub(:current_business).and_return(business)

    within("#bid") do
      fill_in "Amount", with: "1000"
      click_on "Bid Now!"
    end

    click_on "End Auction"

    visit business_path(business.url, business.id)
    expect(page).to have_content(human.scum_name)

    visit admin_business_path(business.url, business.id)
    expect(page).to have_content(human.scum_name)

    visit auctions_path
    expect(page).to_not have_content(human.scum_name)

  end
end
