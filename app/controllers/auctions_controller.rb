class AuctionsController < ApplicationController

  def index
    @auctions = Auction.where(status: "live")
  end

  def show
    @auction = Auction.find(params[:id])
  end

end
