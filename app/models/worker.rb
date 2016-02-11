class Worker

  def self.update_auction
    Auction.where(status: 'live').each do |auction|
      if ((auction.time_left < 0) && (auction.winning_bid.bid.user))
        auction.assign_winner_of(auction)
      end
    end
  end
end
