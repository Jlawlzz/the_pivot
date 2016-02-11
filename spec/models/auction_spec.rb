require 'rails_helper'

RSpec.describe Auction, type: :model do

   it "returns true and sets new high bid if amount greater than high bid" do
    auction = Auction.create
    bid = Bid.create(amount: 6)
    auction.bids << Bid.create(amount: 6)
    auction.winning_bid.update_attribute(:bid_id, bid.id)

    expect(auction.highest_bid?(7)).to be true
    auction.set_high_bid(Bid.create(amount: 7).id)
    expect(auction.winning_bid.bid.amount).to eq(7)
  end

  it "can set high bid" do
    auction = Auction.create
    bid = Bid.create(amount: 6)
    auction.bids << bid
    auction.set_high_bid(bid.id)

    expect(auction.winning_bid.bid).to eq (bid)
  end

  it "can declare high bid" do
    auction = Auction.create
    bid = Bid.create(amount: 6)
    auction.bids << bid
    auction.set_high_bid(bid.id)

    expect(auction.high_bid).to eq (6)
  end

  it "can evaluate high bid" do
    auction = Auction.create
    bid = Bid.create(amount: 6)
    auction.bids << bid
    auction.set_high_bid(bid.id)

    expect(auction.highest_bid?(4)).to eq (false)
    expect(auction.highest_bid?(7)).to eq (true)
  end

  it "can evaluate user placed bid" do
    user = User.create(first_name: "Admin",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    auction = Auction.create
    bid = Bid.create(amount: 6, user_id: user.id)
    auction.bids << bid
    auction.set_high_bid(bid.id)

    expect(auction.bidder).to eq (user)
  end

  it "can evaluate business placed bid" do
    user = User.create(first_name: "Admin",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    business = create(:business)

    auction = Auction.create
    bid = Bid.create(amount: 6, user_id: user.id, business_id: business.id)
    auction.bids << bid
    auction.set_high_bid(bid.id)

    expect(auction.bidder).to eq (business)
  end

  it "can assign winner of auction" do
    user = User.create(first_name: "Admin",
                        last_name: "guy",
                        username: "admin",
                        password: "password",
                        role: 1)

    business = create(:business)

    auction = Auction.create
    bid = Bid.create(amount: 5, business_id: business.id)
    auction.bids << bid
    bid = Bid.create(amount: 6, user_id: user.id, business_id: business.id)
    auction.bids << bid
    auction.set_high_bid(bid.id)

    expect(auction.assign_winner).to eq (business)
  end

end
