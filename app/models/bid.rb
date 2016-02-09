class Bid < ActiveRecord::Base
  belongs_to :business
  belongs_to :auction
  belongs_to :user
  belongs_to :winning_bid
end
