class BidsController < ApplicationController

  def create
    @auction = Auction.find(set_auction_id)
    if @auction.highest_bid?(params[:bid][:amount])
      set_new_bid
    else
      bid_too_low_alert
    end
  end

  private

    def set_bid(params)
      params = params.require(:bid).permit(:amount)
      params[:business_id] = current_business.id if current_business
      params[:auction_id] = set_auction_id
      params[:user_id] = current_user.id
      params
    end

    def set_auction_id
      params[:format]
    end

    def set_new_bid
      bid = Bid.create(set_bid(params))
      @auction.set_high_bid(bid.id)
      flash[:notice] = {color: "green", message: "You have succesfully placed a bid of #{bid.amount}!"}
      redirect_to auction_path(set_auction_id)
    end

    def bid_too_low_alert
      flash[:notice] = {color: "red", message: "Must place bid higher than current high bid."}
      redirect_to auction_path(set_auction_id)
    end
end
