class Bid < ActiveRecord::Base
  belongs_to :business
  belongs_to :auction
end
