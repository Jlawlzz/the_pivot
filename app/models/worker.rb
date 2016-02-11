class Worker

  def self.update_auction
    Auction.where(status: 'live').each do |auction|
      if ((auction.time_left <= 0) && (auction.winning_bid.bid.user))
        auction.assign_winner
      else
        auction.close_auction
        Auction.create(human_id: auction.human_id)
      end
    end
  end
end
