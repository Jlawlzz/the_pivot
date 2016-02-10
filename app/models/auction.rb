class Auction < ActiveRecord::Base
  belongs_to :human
  belongs_to :business
  has_many :bids
  belongs_to :winning_bid

  def initialize(stuff = nil)
   super
   self.winning_bid = WinningBid.create unless self.winning_bid
  end

  def highest_bid?(amount)
    if  (high_bid < amount.to_i)
      return true
    else
      return false
    end
  end

  def high_bid
    self.winning_bid.bid.amount
  end

  def set_high_bid(bid_id)
    self.winning_bid.update_attribute(:bid_id, bid_id)
  end
end
