class Auction < ActiveRecord::Base
  belongs_to :human

  def highest_bid?(amount)
    if (high_bid < amount.to_i)
      set_high_bid(amount)
      return true
    end
  end

  def high_bid
    self.winning_bid
  end

  def set_high_bid(amount)
    self.update_attribute(:winning_bid, amount.to_i)
  end
end
