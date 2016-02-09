class AddWinningBidIdToAuctions < ActiveRecord::Migration
  def change
    add_reference :auctions, :winning_bid, index: true, foreign_key: true
  end
end
