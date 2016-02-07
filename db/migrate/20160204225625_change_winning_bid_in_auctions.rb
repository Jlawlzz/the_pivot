class ChangeWinningBidInAuctions < ActiveRecord::Migration
  def change
    change_column :auctions, :winning_bid, :integer, default: 0
  end
end
