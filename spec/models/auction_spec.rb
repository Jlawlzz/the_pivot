require 'rails_helper'

RSpec.describe Auction, type: :model do

   it "returns true and sets new high bid if amount greater than high bid" do
    auction = Auction.create(winning_bid: 5)
    amount = 6

    expect(auction.highest_bid?(amount)).to be true

    auction.highest_bid?(amount)
    expect(auction.winning_bid).to eq(6)
  end

end
