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

end
