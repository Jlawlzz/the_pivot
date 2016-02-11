class WinningBid < ActiveRecord::Base
  belongs_to :bid
  belongs_to :auction

  def initialize(stuff = nil)
    super
    self.bid = (Bid.create(amount: 0)) unless self.bid
  end

end
