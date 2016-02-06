class BidsController < ApplicationController

  def create
    binding.pry
    Bid.create(set_bid_params)
  end

  private

  def set_bid_params
    params.require(:bid).permit(:amount)
  end

end
