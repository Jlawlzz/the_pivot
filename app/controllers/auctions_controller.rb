class AuctionsController < ApplicationController

  def index
    @auctions = Auction.where(status: "live")
  end

  def show
    @business = Business.find_by(params[:business_id])
    @auction = Auction.find(params[:id])
  end

  def declare_winner
    @auction = Auction.find(params[:format].split('/')[0])
    @business = Business.find(params[:format].split('/')[1])
    @business.auctions << @auction
    @auction.update_attribute(:status, "closed")
    redirect_to business_path(@business.url, @business.id)
  end
end
