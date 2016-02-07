class AuctionsController < ApplicationController

    def index
      @auctions = Auction.where(status: "live")
    end

    def show
      @business = Business.find_by(params[:business_id])
      @auction = Auction.find(params[:id])
    end

end
