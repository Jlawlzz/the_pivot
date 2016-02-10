class Auction < ActiveRecord::Base
  belongs_to :human
  belongs_to :business
  has_many :bids
  belongs_to :winning_bid

  def initialize(stuff = nil)
   super
   self.winning_bid = WinningBid.create unless self.winning_bid
   self.expiration_date = get_expire_date unless self.expiration_date
  end

  def time_left
    (self.expiration_date - Time.now).round
  end

  def get_expire_date
     Time.now + 259200
  end

  def highest_bid?(amount)
    high_bid < amount.to_i
  end

  def high_bid
    self.winning_bid.bid.amount
  end

  def set_high_bid(bid_id)
    self.winning_bid.update_attribute(:bid_id, bid_id)
  end
end
