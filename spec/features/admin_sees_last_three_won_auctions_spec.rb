require 'rails_helper'

RSpec.feature "user sees their auctions" do
  scenario "user visits dashboard path and sees past three auctions" do
    roles = create_roles
    humans = create_list(:human, 4)

    business = create(:business)

    admin = User.create(first_name: "jordan",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)
    UserRole.create(business_id: business.id, user_id: admin.id, role_id: roles[1].id)
    UserRole.create(user_id: admin.id, role_id: roles[0].id)

    business.users << admin

    bids = []
    auctions = []
    4.times do |t|
      auctions << Auction.create(human_id: humans[t].id, business_id: business.id)
    end

    4.times do |t|
      bid = Bid.create(amount:50, user_id: admin.id, auction_id: auctions[t].id)
      bids << bid
      auctions[t].winning_bid.update_attribute(:bid_id, bid.id)
    end

    business.users << admin

    login(admin)

    visit dashboard_path

    3.times do |i|
      expect(page).to have_content(humans[i+1].scum_name)
    end
    expect(page).to_not have_content(humans[0].scum_name)
  end
end
