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

  def self.update_auctions
    Auction.where(status: 'live').each do |auction|
      assign_winner_of(auction) if auction.time_left < 0
    end
  end

  def assign_winner_of(auction)
    entity = bidder_of(auction)
    entity.auctions << auction
    auction.update_attribute(:status, "closed")
    entity
  end

  def bidder_of(auction)
    business(auction) ? business(auction) : user(auction)
  end

  def business(auction)
    auction.winning_bid.bid.business
  end

  def user(auction)
    auction.winning_bid.bid.user
  end

  def time_left
    (self.expiration_date - Time.now).round
  end

  def get_expire_date
     Time.now + 600
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
