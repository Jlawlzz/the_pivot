class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :reviews

  has_many :bids
  has_many :auctions, through: :bids
  has_many :winning_bids, through: :bids


  has_many :business_users
  has_many :businesses, through: :business_users

  has_many :auctions
  has_many :humans, through: :auctions

  validates :username, presence: true, uniqueness: true

  enum role: %w(default admin)

  def total_purchased
    orders.sum(:total_price)
  end

  def live_auctions
    live_auctions = auctions.where(status: 'live')
    live_auctions.map do |auction|
      {auction: auction, user_bid: auction.bids.where(user_id: self.id).last.amount}
    end
  end


  def auctions_won(user)
    auctions = Auction.all.select do |auction|
      (auction.winning_bid.bid.user_id == user.id)
    end
  end
end
