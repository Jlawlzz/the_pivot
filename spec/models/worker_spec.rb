require 'rails_helper'

RSpec.describe Worker, type: :model do

   it "sets any expired auctions with winning bid to closed" do

   user = User.create(first_name: "Admin",
                       last_name: "guy",
                       username: "admin",
                       password: "password",
                       role: 1)

    auction = Auction.create(expiration_date: Time.now - 10000, human_id: create(:human).id)
    bid = Bid.create(amount: 6, user_id: user.id)
    auction.bids << Bid.create(amount: 6)
    auction.winning_bid.update_attribute(:bid_id, bid.id)

    Worker.update_auction

    auction = Auction.find(auction.id)

    expect(auction.status).to eq ('closed')
  end

  it "does not set non expired auctions with winning bid to closed" do

  user = User.create(first_name: "Admin",
                      last_name: "guy",
                      username: "admin",
                      password: "password",
                      role: 1)

   auction = Auction.create(human_id: create(:human).id)
   bid = Bid.create(amount: 6, user_id: user.id)
   auction.bids << Bid.create(amount: 6)
   auction.winning_bid.update_attribute(:bid_id, bid.id)

   Worker.update_auction

   auction = Auction.find(auction.id)

   expect(Auction.last.status).to eq ('live')
 end

end
