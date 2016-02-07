require 'rails_helper'

RSpec.feature "user can view live auctions" do
  scenario "they see their live auctions" do

    humans = create_list(:human, 2)

    business = create(:business)

    2.times do |t|
      Auction.create(human_id: humans[t].id)
    end

    auctions = Auction.all

    admin = User.create(first_name: "jordan",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    business.users << admin

    login(admin)

    bid = Bid.create(amount: 50, business_id: business.id, auction_id: auctions[0].id, user_id: admin.id)

	  visit '/'

    click_on "Live Auctions"

    expect(current_path).to eq live_auctions_path

    expect(page).to have_content("Your current live auctions:")
    expect(page).to have_content(humans[0].scum_name)
    expect(page).to_not have_content(humans[1].scum_name)
    expect(page).to have_content(bid.amount)
    expect(page).to have_content(auctions[0].winning_bid)
  end

  scenario "returns collection of auctions and users highest bid for that auction" do

      auction = Auction.create

      admin = User.create(first_name: "jordan",
                          last_name: "guy",
                          username: "admin",
                          password: "password",
                          role: 1)

      login(admin)

      Bid.create(amount: 25, auction_id: auction.id, user_id: admin.id)
      bid = Bid.create(amount: 50, auction_id: auction.id, user_id: admin.id)

      live_auctions = admin.live_auctions

      expect(live_auctions.first[:user_bid]).to eq (50)
      expect(live_auctions.first[:auction]).to eq (auction)
    end
end
